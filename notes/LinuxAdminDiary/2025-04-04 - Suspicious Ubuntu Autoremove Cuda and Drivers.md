
# Works on Ubuntu with KDE:

sudo apt-get install imwheel


# A GUI that generates the proper config
# imwheel_adjust_gui.sh @ `sources/external/imwheel_adjust_gui.sh`
I prefer a value of 3, seems to be a multipler.


### Wave 1

  cuda-cccl-12-8 cuda-command-line-tools-12-8 cuda-compiler-12-8 cuda-crt-12-8 cuda-cudart-12-8 cuda-cudart-dev-12-8 cuda-cuobjdump-12-8
  cuda-cupti-12-8 cuda-cupti-dev-12-8 cuda-cuxxfilt-12-8 cuda-demo-suite-12-8 cuda-documentation-12-8 cuda-driver-dev-12-8 cuda-gdb-12-8
  cuda-libraries-12-8 cuda-libraries-dev-12-8 cuda-nsight-12-8 cuda-nsight-compute-12-8 cuda-nsight-systems-12-8 cuda-nvcc-12-8
  cuda-nvdisasm-12-8 cuda-nvml-dev-12-8 cuda-nvprof-12-8 cuda-nvprune-12-8 cuda-nvrtc-12-8 cuda-nvrtc-dev-12-8 cuda-nvtx-12-8 cuda-nvvm-12-8
  cuda-nvvp-12-8 cuda-opencl-12-8 cuda-opencl-dev-12-8 cuda-profiler-api-12-8 cuda-sanitizer-12-8 cuda-toolkit-12-8
  cuda-toolkit-12-8-config-common cuda-tools-12-8 cuda-visual-tools-12-8 gds-tools-12-8 libcublas-12-8 libcublas-dev-12-8 libcufft-12-8
  libcufft-dev-12-8 libcufile-12-8 libcufile-dev-12-8 libcurand-12-8 libcurand-dev-12-8 libcusolver-12-8 libcusolver-dev-12-8 libcusparse-12-8
  libcusparse-dev-12-8 libnpp-12-8 libnpp-dev-12-8 libnvfatbin-12-8 libnvfatbin-dev-12-8 libnvjitlink-12-8 libnvjitlink-dev-12-8 libnvjpeg-12-8
  libnvjpeg-dev-12-8 linux-headers-5.15.0-134 linux-headers-5.15.0-134-generic linux-headers-6.8.0-51-generic linux-hwe-6.8-headers-6.8.0-51
  linux-hwe-6.8-tools-6.8.0-51 linux-image-6.8.0-51-generic linux-modules-6.8.0-51-generic linux-modules-extra-6.8.0-51-generic
  linux-tools-6.8.0-51-generic nsight-compute-2025.1.1 nsight-systems-2024.6.2 nvidia-firmware-570-570.124.06 nvidia-modprobe




### Wave 2

  cuda-cccl-12-5 cuda-command-line-tools-12-5 cuda-compiler-12-5 cuda-crt-12-5 cuda-cudart-12-5 cuda-cudart-dev-12-5 cuda-cuobjdump-12-5 cuda-cupti-12-5 cuda-cupti-dev-12-5
  cuda-cuxxfilt-12-5 cuda-demo-suite-12-5 cuda-documentation-12-5 cuda-driver-dev-12-5 cuda-gdb-12-5 cuda-libraries-12-5 cuda-libraries-dev-12-5 cuda-nsight-12-5
  cuda-nsight-compute-12-5 cuda-nsight-systems-12-5 cuda-nvcc-12-5 cuda-nvdisasm-12-5 cuda-nvml-dev-12-5 cuda-nvprof-12-5 cuda-nvprune-12-5 cuda-nvrtc-12-5 cuda-nvrtc-dev-12-5
  cuda-nvtx-12-5 cuda-nvvm-12-5 cuda-nvvp-12-5 cuda-opencl-12-5 cuda-opencl-dev-12-5 cuda-profiler-api-12-5 cuda-sanitizer-12-5 cuda-toolkit-12-5 cuda-toolkit-12-5-config-common
  cuda-toolkit-12-config-common cuda-toolkit-config-common cuda-tools-12-5 cuda-visual-tools-12-5 gds-tools-12-5 libcublas-12-5 libcublas-dev-12-5 libcufft-12-5 libcufft-dev-12-5
  libcufile-12-5 libcufile-dev-12-5 libcurand-12-5 libcurand-dev-12-5 libcusolver-12-5 libcusolver-dev-12-5 libcusparse-12-5 libcusparse-dev-12-5 libnpp-12-5 libnpp-dev-12-5
  libnvfatbin-12-5 libnvfatbin-dev-12-5 libnvidia-cfg1-555 libnvidia-common-555 libnvidia-decode-555 libnvidia-encode-555 libnvidia-extra-555 libnvidia-fbc1-555 libnvidia-gl-555
  libnvjitlink-12-5 libnvjitlink-dev-12-5 libnvjpeg-12-5 libnvjpeg-dev-12-5 nsight-compute-2024.2.1 nsight-systems-2024.2.3 nvidia-compute-utils-555 nvidia-dkms-555 nvidia-driver-555
  nvidia-firmware-555-555.42.06 nvidia-kernel-common-555 nvidia-kernel-source-555 nvidia-prime nvidia-settings nvidia-utils-555 screen-resolution-extra xserver-xorg-video-nvidia-555


### Important Note:
The following packages have been kept back:
  cuda cuda-drivers



## Updates
 1999  sudo apt-get update
 2000  sudo apt-get upgrade
 2001  sudo apt-get autoremove
 2002  sudo apt-get update
 2003  sudo apt-get upgrade
 2004  sudo apt-get clean
 2005  sudo apt-get dist-upgrade
 2006  sudo apt-get update
 2007  sudo apt-get upgrade
 2008  sudo apt-get autoremove
 2009  sudo apt-get update
 2010  sudo apt-get upgrade cuda cuda-drivers
 2011  modinfo -F version nvidia  
 2012  sudo apt update
 2013  sudo apt upgrade
 2014  sudo apt dist-upgrade
 2015  sudo apt install ubuntu-drivers-common
 2016  sudo ubuntu-drivers devices
 2017  sudo apt install nvidia-driver-545-open
 2018  sudo apt install nvidia-driver-560-open


https://www.cherryservers.com/blog/install-cuda-ubuntu

sudo reboot now

## apt-get install history 2025-04-04 - 12:28pm
```
halechr@RDLU0039:~/repos/Spike3D$ cat /var/log/apt/history.log

Start-Date: 2025-04-01  02:00:19
Commandline: apt-get upgrade -y
Upgrade: containerd.io:amd64 (1.7.26-1, 1.7.27-1), linux-tools-common:amd64 (5.15.0-135.146, 5.15.0-136.147), docker-ce-cli:amd64 (5:28.0.2-1~ubuntu.22.04~jammy, 5:28.0.4-1~ubuntu.22.04~jammy), libmariadb-dev-compat:amd64 (1:10.6.18-0ubuntu0.22.04.1, 1:10.6.21-0ubuntu0.22.04.2), tzdata:amd64 (2024b-0ubuntu0.22.04.1, 2025a-0ubuntu0.22.04), libaom3:amd64 (3.3.0-1, 3.3.0-1ubuntu0.1), ghostscript-x:amd64 (9.55.0~dfsg1-0ubuntu5.10, 9.55.0~dfsg1-0ubuntu5.11), gir1.2-javascriptcoregtk-4.0:amd64 (2.46.6-0ubuntu0.22.04.1, 2.48.0-0ubuntu0.22.04.1), gir1.2-webkit2-4.0:amd64 (2.46.6-0ubuntu0.22.04.1, 2.48.0-0ubuntu0.22.04.1), libgs9-common:amd64 (9.55.0~dfsg1-0ubuntu5.10, 9.55.0~dfsg1-0ubuntu5.11), docker-ce:amd64 (5:28.0.2-1~ubuntu.22.04~jammy, 5:28.0.4-1~ubuntu.22.04~jammy), ghostscript:amd64 (9.55.0~dfsg1-0ubuntu5.10, 9.55.0~dfsg1-0ubuntu5.11), docker-ce-rootless-extras:amd64 (5:28.0.2-1~ubuntu.22.04~jammy, 5:28.0.4-1~ubuntu.22.04~jammy), libjavascriptcoregtk-4.0-18:amd64 (2.46.6-0ubuntu0.22.04.1, 2.48.0-0ubuntu0.22.04.1), mariadb-common:amd64 (1:10.6.18-0ubuntu0.22.04.1, 1:10.6.21-0ubuntu0.22.04.2), libmariadb3:amd64 (1:10.6.18-0ubuntu0.22.04.1, 1:10.6.21-0ubuntu0.22.04.2), libwebkit2gtk-4.0-37:amd64 (2.46.6-0ubuntu0.22.04.1, 2.48.0-0ubuntu0.22.04.1), libmariadb-dev:amd64 (1:10.6.18-0ubuntu0.22.04.1, 1:10.6.21-0ubuntu0.22.04.2), libgs9:amd64 (9.55.0~dfsg1-0ubuntu5.10, 9.55.0~dfsg1-0ubuntu5.11), linux-libc-dev:amd64 (5.15.0-135.146, 5.15.0-136.147)
End-Date: 2025-04-01  02:00:37

Start-Date: 2025-04-04  12:03:57
Commandline: packagekit role='update-packages'
Requested-By: halechr (114191263)
Install: libcusolver-dev-12-8:amd64 (11.7.3.90-1, automatic), libcurand-12-8:amd64 (10.3.9.90-1, automatic), cuda-cudart-dev-12-8:amd64 (12.8.90-1, automatic), cuda-opencl-dev-12-8:amd64 (12.8.90-1, automatic), linux-hwe-6.8-headers-6.8.0-57:amd64 (6.8.0-57.59~22.04.1, automatic), cuda-gdb-12-8:amd64 (12.8.90-1, automatic), nsight-systems-2024.6.2:amd64 (2024.6.2.225-246235244400v0, automatic), cuda-opencl-12-8:amd64 (12.8.90-1, automatic), libnvjpeg-dev-12-8:amd64 (12.3.5.92-1, automatic), linux-modules-6.8.0-57-generic:amd64 (6.8.0-57.59~22.04.1, automatic), libcufile-12-8:amd64 (1.13.1.3-1, automatic), linux-headers-5.15.0-136-generic:amd64 (5.15.0-136.147, automatic), linux-hwe-6.8-tools-6.8.0-57:amd64 (6.8.0-57.59~22.04.1, automatic), linux-headers-5.15.0-136:amd64 (5.15.0-136.147, automatic), cuda-libraries-12-8:amd64 (12.8.1-1, automatic), cuda-nsight-compute-12-8:amd64 (12.8.1-1, automatic), libnvjitlink-dev-12-8:amd64 (12.8.93-1, automatic), cuda-nsight-12-8:amd64 (12.8.90-1, automatic), cuda-tools-12-8:amd64 (12.8.1-1, automatic), cuda-cuobjdump-12-8:amd64 (12.8.90-1, automatic), linux-image-6.8.0-57-generic:amd64 (6.8.0-57.59~22.04.1, automatic), linux-headers-6.8.0-57-generic:amd64 (6.8.0-57.59~22.04.1, automatic), cuda-libraries-dev-12-8:amd64 (12.8.1-1, automatic), cuda-toolkit-12-8:amd64 (12.8.1-1, automatic), libnvfatbin-12-8:amd64 (12.8.90-1, automatic), cuda-driver-dev-12-8:amd64 (12.8.90-1, automatic), cuda-nsight-systems-12-8:amd64 (12.8.1-1, automatic), cuda-nvrtc-12-8:amd64 (12.8.93-1, automatic), cuda-command-line-tools-12-8:amd64 (12.8.1-1, automatic), cuda-nvdisasm-12-8:amd64 (12.8.90-1, automatic), libcurand-dev-12-8:amd64 (10.3.9.90-1, automatic), libnvjpeg-12-8:amd64 (12.3.5.92-1, automatic), cuda-sanitizer-12-8:amd64 (12.8.93-1, automatic), cuda-documentation-12-8:amd64 (12.8.90-1, automatic), libcublas-dev-12-8:amd64 (12.8.4.1-1, automatic), nsight-compute-2025.1.1:amd64 (2025.1.1.2-1, automatic), cuda-cuxxfilt-12-8:amd64 (12.8.90-1, automatic), cuda-cccl-12-8:amd64 (12.8.90-1, automatic), cuda-cupti-12-8:amd64 (12.8.90-1, automatic), libcusparse-dev-12-8:amd64 (12.5.8.93-1, automatic), libnpp-12-8:amd64 (12.3.3.100-1, automatic), cuda-visual-tools-12-8:amd64 (12.8.1-1, automatic), libnvjitlink-12-8:amd64 (12.8.93-1, automatic), libcusolver-12-8:amd64 (11.7.3.90-1, automatic), linux-tools-6.8.0-57-generic:amd64 (6.8.0-57.59~22.04.1, automatic), libcufile-dev-12-8:amd64 (1.13.1.3-1, automatic), libcufft-12-8:amd64 (11.3.3.83-1, automatic), cuda-nvprune-12-8:amd64 (12.8.90-1, automatic), cuda-nvvm-12-8:amd64 (12.8.93-1, automatic), linux-modules-extra-6.8.0-57-generic:amd64 (6.8.0-57.59~22.04.1, automatic), libcublas-12-8:amd64 (12.8.4.1-1, automatic), cuda-cudart-12-8:amd64 (12.8.90-1, automatic), cuda-nvrtc-dev-12-8:amd64 (12.8.93-1, automatic), cuda-nvprof-12-8:amd64 (12.8.90-1, automatic), libcufft-dev-12-8:amd64 (11.3.3.83-1, automatic), cuda-demo-suite-12-8:amd64 (12.8.90-1, automatic), libnpp-dev-12-8:amd64 (12.3.3.100-1, automatic), nvidia-firmware-570-570.124.06:amd64 (570.124.06-0ubuntu1, automatic), libcusparse-12-8:amd64 (12.5.8.93-1, automatic), cuda-toolkit-12-8-config-common:amd64 (12.8.90-1, automatic), cuda-profiler-api-12-8:amd64 (12.8.90-1, automatic), gds-tools-12-8:amd64 (1.13.1.3-1, automatic), libnvfatbin-dev-12-8:amd64 (12.8.90-1, automatic), cuda-nvvp-12-8:amd64 (12.8.93-1, automatic), cuda-crt-12-8:amd64 (12.8.93-1, automatic), cuda-nvtx-12-8:amd64 (12.8.90-1, automatic), cuda-nvcc-12-8:amd64 (12.8.93-1, automatic), cuda-cupti-dev-12-8:amd64 (12.8.90-1, automatic), cuda-compiler-12-8:amd64 (12.8.1-1, automatic), nvidia-modprobe:amd64 (570.124.06-0ubuntu1, automatic), cuda-nvml-dev-12-8:amd64 (12.8.90-1, automatic)
Upgrade: udev:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), linux-headers-generic:amd64 (5.15.0.134.133, 5.15.0.136.134), systemd-container:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), gpg:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), tzdata:amd64 (2025a-0ubuntu0.22.04, 2025b-0ubuntu0.22.04), xserver-xorg-core:amd64 (2:21.1.4-2ubuntu1.7~22.04.13, 2:21.1.4-2ubuntu1.7~22.04.14), libpam-systemd:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), linux-image-generic-hwe-22.04:amd64 (6.8.0-52.53~22.04.1, 6.8.0-57.59~22.04.1), libsystemd0:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), libnss-systemd:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), gnupg:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), gpg-wks-server:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), systemd:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), libudev1:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), gpg-agent:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), xserver-xorg-legacy:amd64 (2:21.1.4-2ubuntu1.7~22.04.13, 2:21.1.4-2ubuntu1.7~22.04.14), libnss-mymachines:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), xserver-common:amd64 (2:21.1.4-2ubuntu1.7~22.04.13, 2:21.1.4-2ubuntu1.7~22.04.14), gpgv:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), xserver-xorg-dev:amd64 (2:21.1.4-2ubuntu1.7~22.04.13, 2:21.1.4-2ubuntu1.7~22.04.14), linux-headers-generic-hwe-22.04:amd64 (6.8.0-52.53~22.04.1, 6.8.0-57.59~22.04.1), linux-generic-hwe-22.04:amd64 (6.8.0-52.53~22.04.1, 6.8.0-57.59~22.04.1), gpgsm:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), xvfb:amd64 (2:21.1.4-2ubuntu1.7~22.04.13, 2:21.1.4-2ubuntu1.7~22.04.14), xserver-xephyr:amd64 (2:21.1.4-2ubuntu1.7~22.04.13, 2:21.1.4-2ubuntu1.7~22.04.14), dirmngr:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), systemd-sysv:amd64 (249.11-0ubuntu3.12, 249.11-0ubuntu3.15), gnupg-utils:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), gnupg-l10n:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), gpg-wks-client:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3), gpgconf:amd64 (2.2.27-3ubuntu2.1, 2.2.27-3ubuntu2.3)
End-Date: 2025-04-04  12:09:38

Start-Date: 2025-04-04  12:14:57
Commandline: apt-get autoremove
Requested-By: halechr (114191263)
Remove: libcusolver-dev-12-8:amd64 (11.7.3.90-1), libcurand-12-8:amd64 (10.3.9.90-1), cuda-cudart-dev-12-8:amd64 (12.8.90-1), cuda-opencl-dev-12-8:amd64 (12.8.90-1), linux-hwe-6.8-headers-6.8.0-51:amd64 (6.8.0-51.52~22.04.1), cuda-gdb-12-8:amd64 (12.8.90-1), nsight-systems-2024.6.2:amd64 (2024.6.2.225-246235244400v0), cuda-opencl-12-8:amd64 (12.8.90-1), linux-modules-6.8.0-51-generic:amd64 (6.8.0-51.52~22.04.1), libnvjpeg-dev-12-8:amd64 (12.3.5.92-1), linux-headers-5.15.0-134-generic:amd64 (5.15.0-134.145), libcufile-12-8:amd64 (1.13.1.3-1), linux-hwe-6.8-tools-6.8.0-51:amd64 (6.8.0-51.52~22.04.1), linux-headers-5.15.0-134:amd64 (5.15.0-134.145), cuda-libraries-12-8:amd64 (12.8.1-1), cuda-nsight-compute-12-8:amd64 (12.8.1-1), linux-image-6.8.0-51-generic:amd64 (6.8.0-51.52~22.04.1), linux-headers-6.8.0-51-generic:amd64 (6.8.0-51.52~22.04.1), libnvjitlink-dev-12-8:amd64 (12.8.93-1), cuda-nsight-12-8:amd64 (12.8.90-1), cuda-tools-12-8:amd64 (12.8.1-1), cuda-cuobjdump-12-8:amd64 (12.8.90-1), cuda-libraries-dev-12-8:amd64 (12.8.1-1), cuda-toolkit-12-8:amd64 (12.8.1-1), libnvfatbin-12-8:amd64 (12.8.90-1), cuda-driver-dev-12-8:amd64 (12.8.90-1), cuda-nsight-systems-12-8:amd64 (12.8.1-1), cuda-nvrtc-12-8:amd64 (12.8.93-1), cuda-command-line-tools-12-8:amd64 (12.8.1-1), cuda-nvdisasm-12-8:amd64 (12.8.90-1), libcurand-dev-12-8:amd64 (10.3.9.90-1), libnvjpeg-12-8:amd64 (12.3.5.92-1), cuda-sanitizer-12-8:amd64 (12.8.93-1), cuda-documentation-12-8:amd64 (12.8.90-1), libcublas-dev-12-8:amd64 (12.8.4.1-1), nsight-compute-2025.1.1:amd64 (2025.1.1.2-1), cuda-cuxxfilt-12-8:amd64 (12.8.90-1), cuda-cccl-12-8:amd64 (12.8.90-1), cuda-cupti-12-8:amd64 (12.8.90-1), libcusparse-dev-12-8:amd64 (12.5.8.93-1), libnpp-12-8:amd64 (12.3.3.100-1), cuda-visual-tools-12-8:amd64 (12.8.1-1), libnvjitlink-12-8:amd64 (12.8.93-1), linux-tools-6.8.0-51-generic:amd64 (6.8.0-51.52~22.04.1), libcusolver-12-8:amd64 (11.7.3.90-1), libcufile-dev-12-8:amd64 (1.13.1.3-1), libcufft-12-8:amd64 (11.3.3.83-1), cuda-nvprune-12-8:amd64 (12.8.90-1), cuda-nvvm-12-8:amd64 (12.8.93-1), libcublas-12-8:amd64 (12.8.4.1-1), cuda-cudart-12-8:amd64 (12.8.90-1), cuda-nvrtc-dev-12-8:amd64 (12.8.93-1), cuda-nvprof-12-8:amd64 (12.8.90-1), libcufft-dev-12-8:amd64 (11.3.3.83-1), cuda-demo-suite-12-8:amd64 (12.8.90-1), libnpp-dev-12-8:amd64 (12.3.3.100-1), nvidia-firmware-570-570.124.06:amd64 (570.124.06-0ubuntu1), libcusparse-12-8:amd64 (12.5.8.93-1), cuda-toolkit-12-8-config-common:amd64 (12.8.90-1), cuda-profiler-api-12-8:amd64 (12.8.90-1), gds-tools-12-8:amd64 (1.13.1.3-1), libnvfatbin-dev-12-8:amd64 (12.8.90-1), cuda-nvvp-12-8:amd64 (12.8.93-1), cuda-crt-12-8:amd64 (12.8.93-1), cuda-nvtx-12-8:amd64 (12.8.90-1), cuda-nvcc-12-8:amd64 (12.8.93-1), cuda-cupti-dev-12-8:amd64 (12.8.90-1), linux-modules-extra-6.8.0-51-generic:amd64 (6.8.0-51.52~22.04.1), cuda-compiler-12-8:amd64 (12.8.1-1), nvidia-modprobe:amd64 (570.124.06-0ubuntu1), cuda-nvml-dev-12-8:amd64 (12.8.90-1)
End-Date: 2025-04-04  12:15:21

Start-Date: 2025-04-04  12:16:01
Commandline: apt-get dist-upgrade
Requested-By: halechr (114191263)
Remove: cuda-drivers:amd64 (555.42.06-1), cuda-drivers-555:amd64 (555.42.06-1), cuda-12-5:amd64 (12.5.1-1), cuda-runtime-12-5:amd64 (12.5.1-1), cuda:amd64 (12.5.1-1)
End-Date: 2025-04-04  12:16:02

Start-Date: 2025-04-04  12:16:29
Commandline: apt-get autoremove
Requested-By: halechr (114191263)
Remove: libcusolver-dev-12-5:amd64 (11.6.3.83-1), libcurand-12-5:amd64 (10.3.6.82-1), libnvidia-common-555:amd64 (555.42.06-0ubuntu1), cuda-toolkit-12-5-config-common:amd64 (12.5.82-1), libnvidia-fbc1-555:amd64 (555.42.06-0ubuntu1), cuda-cudart-dev-12-5:amd64 (12.5.82-1), libnvidia-gl-555:amd64 (555.42.06-0ubuntu1), cuda-opencl-dev-12-5:amd64 (12.5.39-1), nsight-systems-2024.2.3:amd64 (2024.2.3.38-242334140272v0), cuda-gdb-12-5:amd64 (12.5.82-1), libnvidia-extra-555:amd64 (555.42.06-0ubuntu1), nvidia-compute-utils-555:amd64 (555.42.06-0ubuntu1), nvidia-dkms-555:amd64 (555.42.06-0ubuntu1), cuda-opencl-12-5:amd64 (12.5.39-1), nvidia-driver-555:amd64 (555.42.06-0ubuntu1), libnvjpeg-dev-12-5:amd64 (12.3.2.81-1), libcufile-12-5:amd64 (1.10.1.7-1), libnvidia-encode-555:amd64 (555.42.06-0ubuntu1), cuda-libraries-12-5:amd64 (12.5.1-1), cuda-nsight-compute-12-5:amd64 (12.5.1-1), libnvjitlink-dev-12-5:amd64 (12.5.82-1), cuda-nsight-12-5:amd64 (12.5.82-1), cuda-tools-12-5:amd64 (12.5.1-1), nvidia-utils-555:amd64 (555.42.06-0ubuntu1), cuda-cuobjdump-12-5:amd64 (12.5.39-1), xserver-xorg-video-nvidia-555:amd64 (555.42.06-0ubuntu1), cuda-libraries-dev-12-5:amd64 (12.5.1-1), cuda-toolkit-12-5:amd64 (12.5.1-1), libnvfatbin-12-5:amd64 (12.5.82-1), cuda-toolkit-config-common:amd64 (12.8.90-1), cuda-driver-dev-12-5:amd64 (12.5.82-1), cuda-nsight-systems-12-5:amd64 (12.5.1-1), cuda-nvrtc-12-5:amd64 (12.5.82-1), cuda-command-line-tools-12-5:amd64 (12.5.1-1), cuda-nvdisasm-12-5:amd64 (12.5.39-1), libcurand-dev-12-5:amd64 (10.3.6.82-1), libnvidia-decode-555:amd64 (555.42.06-0ubuntu1), libnvjpeg-12-5:amd64 (12.3.2.81-1), cuda-sanitizer-12-5:amd64 (12.5.81-1), nsight-compute-2024.2.1:amd64 (2024.2.1.2-1), cuda-documentation-12-5:amd64 (12.5.82-1), nvidia-kernel-common-555:amd64 (555.42.06-0ubuntu1), libcublas-dev-12-5:amd64 (12.5.3.2-1), cuda-cuxxfilt-12-5:amd64 (12.5.82-1), cuda-cccl-12-5:amd64 (12.5.39-1), cuda-cupti-12-5:amd64 (12.5.82-1), libcusparse-dev-12-5:amd64 (12.5.1.3-1), nvidia-prime:amd64 (0.8.17.1), libnpp-12-5:amd64 (12.3.0.159-1), cuda-visual-tools-12-5:amd64 (12.5.1-1), libnvjitlink-12-5:amd64 (12.5.82-1), libcusolver-12-5:amd64 (11.6.3.83-1), screen-resolution-extra:amd64 (0.18.2), nvidia-settings:amd64 (570.124.06-0ubuntu1), libcufile-dev-12-5:amd64 (1.10.1.7-1), libcufft-12-5:amd64 (11.2.3.61-1), nvidia-firmware-555-555.42.06:amd64 (555.42.06-0ubuntu1), cuda-nvprune-12-5:amd64 (12.5.82-1), cuda-nvvm-12-5:amd64 (12.5.82-1), libcublas-12-5:amd64 (12.5.3.2-1), cuda-cudart-12-5:amd64 (12.5.82-1), cuda-nvrtc-dev-12-5:amd64 (12.5.82-1), libnvidia-cfg1-555:amd64 (555.42.06-0ubuntu1), cuda-nvprof-12-5:amd64 (12.5.82-1), libcufft-dev-12-5:amd64 (11.2.3.61-1), cuda-demo-suite-12-5:amd64 (12.5.82-1), nvidia-kernel-source-555:amd64 (555.42.06-0ubuntu1), libnpp-dev-12-5:amd64 (12.3.0.159-1), libcusparse-12-5:amd64 (12.5.1.3-1), cuda-profiler-api-12-5:amd64 (12.5.39-1), gds-tools-12-5:amd64 (1.10.1.7-1), libnvfatbin-dev-12-5:amd64 (12.5.82-1), cuda-nvvp-12-5:amd64 (12.5.82-1), cuda-crt-12-5:amd64 (12.5.82-1), cuda-nvtx-12-5:amd64 (12.5.82-1), cuda-nvcc-12-5:amd64 (12.5.82-1), cuda-cupti-dev-12-5:amd64 (12.5.82-1), cuda-compiler-12-5:amd64 (12.5.1-1), cuda-toolkit-12-config-common:amd64 (12.8.90-1), cuda-nvml-dev-12-5:amd64 (12.5.82-1)
End-Date: 2025-04-04  12:17:07

Start-Date: 2025-04-04  12:23:23
Commandline: apt install nvidia-driver-560-open
Requested-By: halechr (114191263)
Install: libnvidia-common-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-firmware-560-560.35.05:amd64 (560.35.05-0ubuntu1, automatic), libnvidia-fbc1-560:amd64 (560.35.05-0ubuntu1, automatic), libnvidia-gl-560:amd64 (560.35.05-0ubuntu1, automatic), libnvidia-extra-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-compute-utils-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-kernel-source-560-open:amd64 (560.35.05-0ubuntu1, automatic), libnvidia-encode-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-utils-560:amd64 (560.35.05-0ubuntu1, automatic), xserver-xorg-video-nvidia-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-driver-560-open:amd64 (560.35.05-0ubuntu1), libnvidia-decode-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-kernel-common-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-prime:amd64 (0.8.17.1, automatic), screen-resolution-extra:amd64 (0.18.2, automatic), nvidia-settings:amd64 (570.124.06-0ubuntu1, automatic), nvidia-dkms-560-open:amd64 (560.35.05-0ubuntu1, automatic), libnvidia-cfg1-560:amd64 (560.35.05-0ubuntu1, automatic), libnvidia-compute-560:amd64 (560.35.05-0ubuntu1, automatic), nvidia-modprobe:amd64 (570.124.06-0ubuntu1, automatic)
Remove: libnvidia-compute-555:amd64 (555.42.06-0ubuntu1)
End-Date: 2025-04-04  12:25:22
```

## upgrade seemingly worked!
