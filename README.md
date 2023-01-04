# Scp Challenge

Please, check below the resolution of each test item.




## 1 - CI pipelines 

  - a)
    - 1: [Click here](https://github.com/jeremiasrg/Scp-challenge/blob/master/.github/workflows/OnPR.yaml) to see the workflow to merge a selected branch with master assuring that master will always be buildable and without failing tests.
    - 2: [Click here](https://github.com/jeremiasrg/Scp-challenge/blob/master/app/build.gradle#L54) to see the configuration to set a limit for 40% in coverage tests.
  
  - b)
    - 1: [Click here](https://github.com/jeremiasrg/Scp-challenge/blob/master/.github/workflows/AutoMergeReleases.yaml) to see the workflow created to propagate the commits on release branches.
      - [Click here](https://github.com/jeremiasrg/Scp-challenge/actions/runs/2335338666) to see this workflow executed. 
    - 2: In case that a conflict occur we can use the structure of Pull Request to solve the problem. 
    Besides we can use [this event](https://github.com/jeremiasrg/workflows/blob/main/.github/workflows/AutoMergeReleases.yaml#L20) to do something more. Ej: Send a Teams Message ?
    
IMPORTANT: [Here](https://github.com/jeremiasrg/workflows/tree/main/.github/workflows) is the second repository with reusable workflows, created to avoid code repetitions.  
## 2 - CI devops

  - 1 - Where would you allocate them? ...
    - 1 master for 3 workers. 
    - Advantages: if one master is down the impact will be low.
    - Disadvantages : High number of masters to maintain.

  - 2 - What approach would you follow to configure the master ...
    - Create all the infrastructure using terraform and save the code in a github repo
    - Create an ansible playbook to configure master and workers(Software level).


  - 3 - What approach would you follow to manage this complexity?
    - Split the terraform code and ansible playbooks to implement the differences.

  - 4 - Which backup strategy would you apply ...
    - Using terraform we already have the infraestrutura code saved
    - Using services like AWS S3 to daily backup.

## 3 - Coding: ...

  - [Click here](https://github.com/jeremiasrg/Scp-challenge/blob/master/challenge-3/BuildTimeByPhases.py) to see the python script. 