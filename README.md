
# Nautilus Setup with Examples
This repository is intended to assist users with installing
kubectl and using the [Nautilus](https://portal.nrp-nautilus.io/) hypercluster. 

## Installing Kubectl
If you already have Kubectl installed, you can skip to the next section.
1. Execute the script located in `scripts/install-kubectl.sh`.
2. Add the line output to your shell profile, likely located at `~/.bashrc` on your computer.
3. Restart your shell, or source your rc config file.
## Tour de YAMLs
* `example-pod.yaml` is the simplest file, containing only a single pod that calculates Pi to 2000 digits. The name is `test-pod` in the definition. 
* `pod-gpu.yaml` is a simple pod that requests a GPU. The underlying image uses Ubuntu, so we use `sleep infinity` to make sure it keeps running, and use `scripts/connect.sh` to connect to the pod.
* `job-gpu.yaml` cannot be run straight from the repository, as it relies on using the [Nautilus Gitlab](https://gitlab.nrp-nautilus.io) to pull a user-provided repository and execute the code. Inside the file, anything within square brackets should be replaced with an appropriate name, either the link to the repository or the name of the repository.
   
