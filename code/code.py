# Write your code here :-)
import board
import time
import alarm
import tinys2
import neopixel
import digitalio
import analogio
import wifi
import socketpool
import math

from secrets import secrets

def wifi_connect():
    print("Connecting to AP...")
    try:
      wifi.radio.connect(secrets["ssid"], secrets["password"])
    except BaseException as e:
      print("Caught " + str(e))
      return False

    network = wifi.radio.ap_info
    print("Connected to {} via {}, RSSI = {}".format(network.ssid, network.authmode, network.rssi))
    print("My IP address is", str(wifi.radio.ipv4_address))
    return True

def mail_open_socket():
    server = secrets["smtp_server"]
    print("Connecting to mail server ", server)
    pool = socketpool.SocketPool(wifi.radio)
    sock = pool.socket()
    addr = (server, 25)
    sock.connect(addr)
    return sock

def mail_rxtx(s, msg):
    if msg is not None:
        print('> ' + msg)
        s.send(msg.encode('ascii') + b'\n')

    buff_size = 1024
    buff = bytearray(buff_size)
    s.recv_into(buff)
    x = buff.decode('ascii')
    print('< ' + x.rstrip())
    return x

def mail_send(m_subj, m_msg):
    m_from = secrets["mail_from"]
    m_to   = secrets["mail_to"]

    m_subj = secrets["subject"] + ": " + m_subj

    s = mail_open_socket()
    mail_rxtx(s, None)
    mail_rxtx(s, "HELO pico")
    mail_rxtx(s, "MAIL FROM:{}".format(m_from))
    mail_rxtx(s, "RCPT TO:{}".format(m_to))
    mail_rxtx(s, "DATA")
    mail_rxtx(s, "From: {}\nTo: {}\nSubject: {}\n\n{}\n.".format(m_from, m_to, m_subj, m_msg))

def adcraw_to_voltage(raw):
    v = 4.0309 * (raw / 10000) + 0.8814
    print("raw {} => {}V".format(raw,v))
    return v

def read_voltage():
    v_low  = 11.6
    v_high = 13.0

    adc = analogio.AnalogIn(board.IO18)

    hn_samp = 32
    raws = [ adc.value for i in range(2 * hn_samp + 1) ]
    raws_s     = sorted(raws)
    raw_median = raws_s[hn_samp]

    vs = [ adcraw_to_voltage(raw) for raw in raws_s ]
    v_median = vs[hn_samp]
    v_mean   = sum(vs) / len(vs)
    v_var    = sum([ (v - v_mean)**2 for v in vs ]) / len(vs)
    v_sd     = math.sqrt(v_var)

    status = "Unknown"
    if v_median < v_low:
        status = "WARNING LOW BATTERY"
    elif v_median > v_high:
        status = "WARNING HIGH BATTERY"
    else:
        status = "GOOD BATTERY"

    subj = "{}: {} ± {}V; {}V".format(status, v_mean, v_sd, v_median)
    body = "Median raw: " + str(raw_median) + "\nReadings\n" + "".join([ str(r) + "\n" for r in raws ]) + "\n"

    return (subj, body)

pixel  = neopixel.NeoPixel(board.NEOPIXEL, 1, brightness = 0.3, auto_write = True, pixel_order = neopixel.GRB)

def leds_init():
    global pixel
    pixel[0] = (0,0,0)
    tinys2.set_pixel_power(True)

def leds_close():
    global pixel
    tinys2.set_pixel_power(False)

def leds_set(rgb):
    global pixel
    pixel[0] = rgb

print("Battery Test")

t0 = time.monotonic()

leds_init()
leds_set((0,255,0))

time.sleep(5.0)

(subj, body) = read_voltage()
print(subj)
print(body)

leds_set((0,0,255))
connected = wifi_connect()
if connected:
    mail_send(subj, body)
print(subj)

leds_close()

t1 = time.monotonic()

print("Awake for {}s".format(t1 - t0))


print("Deep sleep")
sleep_time = 6 * 3600.0

time_alarm = alarm.time.TimeAlarm(monotonic_time=time.monotonic() + sleep_time)
alarm.exit_and_deep_sleep_until_alarms(time_alarm)
