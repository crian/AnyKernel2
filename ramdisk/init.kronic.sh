#!/system/bin/sh

sleep 30;

# Set cpu permissions
chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

# kcal config
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_cont
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_hue
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_sat
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_val

# Tweak IO performance after boot complete
echo 128 > /sys/block/sda/queue/read_ahead_kb
echo 1 > /sys/block/sda/queue/iostats
echo 128 > /sys/block/sda/queue/nr_requests

echo 128 > /sys/block/sde/queue/read_ahead_kb
echo 1 > /sys/block/sde/queue/iostats
echo 128 > /sys/block/sde/queue/nr_requests

echo 128 > /sys/block/sdf/queue/read_ahead_kb
echo 1 > /sys/block/sdf/queue/iostats
echo 128 > /sys/block/sdf/queue/nr_requests

# Setup schedutil governor
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 500 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
echo 20000 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/iowait_boost_enable

echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 500 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us
echo 20000 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/iowait_boost_enable

# Set schedtune values
echo 1 > /dev/stune/foreground/schedtune.prefer_idle
echo 0 > /dev/stune/background/schedtune.boost
echo 1 > /dev/stune/top-app/schedtune.boost
echo 0 > /dev/stune/top-app/schedtune.sched_boost
echo 1 > /dev/stune/top-app/schedtune.prefer_idle

# Setup cpusets for better load balancing
echo 0-1,4-5 > /dev/cpuset/application/cpus
echo 0-1 > /dev/cpuset/background/cpus
echo 0-7 > /dev/cpuset/camera-daemon/cpus
echo 0-3,6-7 > /dev/cpuset/foreground/cpus
echo 0-7 > /dev/cpuset/kernel/cpus
echo 0-3 > /dev/cpuset/system-background/cpus
echo 0-1,6-7 > /dev/cpuset/system/cpus
echo 0-7 > /dev/cpuset/top-app/cpus

# For better screen off idle
echo 0-3 > /dev/cpuset/restricted/cpus

# Adjust lmk
echo "18432,23040,27648,32256,55296,80640" > /sys/module/lowmemorykiller/parameters/minfree
