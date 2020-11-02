#!/bin/bash
#SBATCH --job-name=Beam&Breakout
#SBATCH --partition=class
#SBATCH --qos=default
#SBATCH --gres=gpu:1
#SBATCH --mem=2gb
#SBATCH --time=23:00:00

module load cuda/10.1.243
module load cudnn/v7.6.5

srun -N 1 --pty --mem=1gb bash
python3 atari_ddqn.py --train --env BeamRiderNoFrameskip-v4
srun -N 1 --mem=1gb --pty bash
python3 atari_ddqn.py --train --env BreakoutNoFrameskip-v4
wait
