# INSTRUCTIONS ON USING MLDE FOR MODEL TRAINING

## Model Code Repo

   https://github.com/anoops-ai/CosmicTagger.git

## SetUp MLDE

Please use the same login node

    ```bash
cd /grand/projects/determined_eval/code/CosmicTagger/example_submission_scripts/polaris/determined
    ```


### Run Master

       ```bash 
sh start_master.sh
       ```

### Run Database

        ``` bash 
    sh start_master.sh
        ```


### Verify Master

    ``` bash 
   ssh -L 8080:localhost:8080 <LOGIN NODE>
    ```

   Master UI should be accessible - http://localhost:8080/

### Start/Queue agents

    ```bash
   qsub -v MASTER_HOST=<LOGIN NODE> run_ct_pytorch_synthetic_data_ddp.sh
    ```


### Artifacts Location

   /grand/projects/determined_eval/


## Submit experiment

​    On the login node


    ### Create Conda

    ```bash
   conda create -n det python==3.8
   conda activate det
   pip install /grand/projects/determined_eval/bin/master/determined-master_0.21.0_linux_amd64/share/wheels/determined-0.21.0-py3-none-any.whl
    ```

    ### Point to MLDE Master

        ```bash
cd /grand/projects/determined_eval/code/CosmicTagger/determined_configs
export DET_MASTER=http://localhost:8080
export no_proxy=localhost,127.0.0.1
        ```


    ### Create MLDE user and map it with your polaris account (One time)

​       uid and gid can we obtained by running ```id``` in the terminal on the login node 

        ```bash
 det user login admin
 det user create --admin <POLARIS_LOGIN_NAME>
 det user link-with-agent-user --agent-uid <UID> --agent-gid <GID> --agent-user <POLARIS_LOGIN_NAME> --agent-group employee <POLARIS_LOGIN_NAME>
 det user login <POLARIS_LOGIN_NAME>
        ```


    ### Submit Training Job

    #### Single Training Job

        ```bash
   det e create ./test.yaml .
        ```

    #### HPO Training Job

    ```bash
   det e create ./test_hpo.yaml .
    ```

