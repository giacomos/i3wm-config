#!/usr/bin/env python
# -*- coding: utf-8 -*-
import subprocess
import sys
#import NetworkManager as nm
import argparse


# def get_ip_address(ifname):
#     for dev in nm.NetworkManager.GetDevices():
#         if dev.Interface == ifname:
#             if dev.State == 20:
#                 return '<hw Disabled>'
#             elif dev.State == 30:
#                 return '<not connected>'
#             else:
#                 return dev.Ip4Address
#     return '<not found>'

parser = argparse.ArgumentParser(description='Provides some useful infos about the system.')

parser.add_argument('--battery', action='store_true', help="show battery infos")
parser.add_argument('--get-brightness',
                    action='store_true',
                    dest='get_brightness',
                    help="show brightness infos")
parser.add_argument('--set-brightness',
                    action='store',
                    type=int,
                    dest='set_brightness',
                    help="set brightness")
parser.add_argument('--get-keyboard-layout',
                    action='store_true',
                    dest='get_keyboard_layout',
                    help="show keyboard layout infos")
# parser.add_argument('--get-ip',
#                     action='store',
#                     dest='get_ip',
#                     help="get ip for interface")
parser.add_argument('--get-volume',
                    action='store_true',
                    dest='get_volume',
                    help="get source volume")

args = parser.parse_args()

if args.battery:
    p = subprocess.Popen('acpi -b', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    for line in p.stdout.readlines():
        name, infos = line.split(': ')
        status, percentage, eta = infos.split(', ')
        eta = eta[:8]
        sys.stdout.write('%s (%s)\n' % (percentage, eta))
    #retval = p.wait()

elif args.get_brightness:
    command_current_b = 'pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-brightness'
    command_max_b = 'pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-max-brightness'

    p = subprocess.Popen(command_current_b, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    current_b = int(p.stdout.readlines()[0].replace('\n', ''))
    p = subprocess.Popen(command_max_b, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    max_b = int(p.stdout.readlines()[0].replace('\n', ''))
    percentage = current_b * 100 / max_b
    sys.stdout.write('%s%%\n' % percentage)
elif args.set_brightness:
    new_b = int(args.set_brightness)
    command = 'pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --set-brightness %s'
    p = subprocess.Popen(command % new_b, shell=True,
                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
# elif args.get_ip:
#     interface = args.get_ip
#     sys.stdout.write(get_ip_address(interface))
elif args.get_keyboard_layout:
    command = 'setxkbmap -print | grep xkb_symbols | awk \'{print $4}\' | awk -F"+" \'{print $2}\''
    p = subprocess.Popen(command, shell=True,
                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    sys.stdout.write(p.stdout.readlines()[0])
elif args.get_volume:
    import alsaaudio
    m = alsaaudio.Mixer(control='IEC958', id=0)   # defined alsaaudio.Mixer to change volume
    sys.stdout.write(m.getvolume())
else:
    parser.print_help()
