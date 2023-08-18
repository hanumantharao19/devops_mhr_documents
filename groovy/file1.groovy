def name = "hanumantharao"
def env = "test"
def folders = []
folders <<  "hr"
folders << "sales"
folders << "marketing"

for (folder in folders){
    def basepath = env + '/'+folder
    def files = findFiles(glob: "$basepath/*.job")
    files.each{
        println "processing file - ${it.name} available at ${it.path}"
        def script = readFile(it.path)
        jobDSL scriptText: script
    }
}
################

if(a=10){
  echo "value is 10"
}if(a=20){
   echo "vaue is 20"
}
----
if(a=10){
   echo "value  is 10" 
}else{

}
-----
