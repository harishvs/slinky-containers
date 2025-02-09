release_version="5.0.0"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 763104351884.dkr.ecr.us-east-1.amazonaws.com
docker build --target slurmd -t slurmd:24.05.4  .
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/u1m6g1t5
docker tag slurmd:24.05.4 public.ecr.aws/u1m6g1t5/harish/slinky-slurmd-aws-pytorch-training:$release_version
docker push public.ecr.aws/u1m6g1t5/harish/slinky-slurmd-aws-pytorch-training:$release_version