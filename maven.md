
## types of build tools
- ant
- gradle
- maven
   - maven : maven is build tool whcih is used to compile the code,test the code , pakage the code  and deploy the code 
   remote server (java code)

- Maven component in pom.xml
   - pom project object model
   
   <groupId>com.hdfcbank.payment</groupId>
   <artifactId>paymaent-gateay</artifactId>
   <version>1.0.0</version>
   <packaging/>jar<packaging/>
- type packages
   - jar( java archive file)
     - it contains all .class files 
   - war( web archive file)
      - it contains .class files ,jsp file and html files as well
- Geneally maven has two types of version
  - sanpshot version
     - <version>1.0.0-SNAPSHOT</version> 
       ```
        example: 
         1.0.0-SNAPSHOT-1
         1.0.0-SNAPSHOT-2
         1.0.0-SNAPSHOT-3
       ```
    
      <snapshotRepository>
      <id>nexus</id>
       <name>nexus-snapshot</name>
        <url>http://localhost:8081/repository/maven-snapshots/</url>
      ```
      
    </snapshotRepository>
  - release version
    - <version>1.0.0</version>
      ```
     <repository>
      <id>nexus</id>
      <name>nexus-release</name>
      <url>http://localhost:8081/repository/maven-releases/</url>
      </repository>
      ```
## maven life cycle
  - validate - validate the project is correct and all necessary information is available
   - compile - compile the source code of the project
- test - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
- package - take the compiled code and package it in its distributable format, such as a JAR.
- verify - run any checks on results of integration tests to ensure quality criteria are met
- install - install the package into the local repository, for use as a dependency in other projects locally
- deploy - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects.

 