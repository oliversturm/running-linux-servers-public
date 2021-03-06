title: Running Linux Servers
subtitle: Where would Azure be without them?
class: animation-fade
layout: true

<!-- This slide will serve as the base layout for all your slides -->

.bottom-bar[
{{title}}
]

---

class: impact

# {{title}}

## {{subtitle}}

.title-oli[
Oliver Sturm &bull; @olivers &bull; oliver@oliversturm.com
]

.title-logo[
<img src="template/devexpress.png" id="devexpress" alt="DevExpress">
]

---

## Oliver Sturm

- Training Director at DevExpress
- Consultant, trainer, author, software architect and developer for over 25 years

- Contact: oliver@oliversturm.com

---

## Agenda

.svg-right[
![Tux](template/Tux.svg)
]

- Connecting To Servers
- Dealing With Log Files
- Automating Backups

- ... and a lot of details on the way!

---

## Connecting to Servers

- Use _SSH_
  - ... with _public key encryption_!
- _mosh_ can survive connection faults and roaming
- _tmux_ and _screen_ can detach and resume sessions
  - also enable console-level window handling

---

class: impact

# DEMO

---

## Dealing With Log Files

- Log output is delivered to files by a daemon, based on rules
- `/var/log` is the main log directory
- Logs are rotated, archived and removed on schedule
- Many special tools exist for log analysis purposes
- Standard Unix command line tools can be used for manual analysis purposes

---

class: impact

# DEMO

---

## Automating Backups

- Traditional command: `tar`

- `rsync` synchronizes files (duh!)

  - Can use SSH for transport
  - Efficient partial file transfer

- Beyond that, I recommend [duplicity](http://duplicity.nongnu.org/)
  - Backup generation handling
  - 20+ backup storage services supported

---

class: impact

# DEMO

---

## Sources

- This presentation:

  - https://oliversturm.github.io/running-linux-servers-public
  - PDF download: https://oliversturm.github.io/running-linux-servers-public/slides.pdf

- Demo code:

  - https://github.com/oliversturm/running-linux-servers-public

---

class: impact

# Thank You

Please feel free to contact me about the content anytime.

.title-oli[
Oliver Sturm &bull; @olivers &bull; oliver@oliversturm.com
]

.title-logo[
<img src="template/devexpress.png" id="devexpress" alt="DevExpress">
]
