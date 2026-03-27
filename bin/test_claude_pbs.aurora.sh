#!/bin/bash
#PBS -N test_claude
#PBS -q debug
#PBS -l select=1
#PBS -A gpu_hack
#PBS -l filesystems=home:flare
#PBS -l walltime=00:10:00
#PBS -o /home/hyoklee/clio-core/test_claude_pbs.out
#PBS -j oe

echo "=== Claude on compute node test ==="
echo "=== Host: $(hostname)  Date: $(date) ==="

# Proxy required for internet access from compute nodes
export http_proxy="http://proxy.alcf.anl.gov:3128"
export https_proxy="http://proxy.alcf.anl.gov:3128"
export ftp_proxy="http://proxy.alcf.anl.gov:3128"

CLAUDE=/home/hyoklee/.local/bin/claude

echo "--- Claude version ---"
${CLAUDE} --version

echo "--- Simple prompt test ---"
${CLAUDE} -p "Say hello from Aurora compute node $(hostname) in one sentence." 

echo "=== Done at $(date) ==="
