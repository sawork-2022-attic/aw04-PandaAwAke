#定制的镜像都是基于 FROM 的镜像(可以从docker hub上找)
FROM openjdk

#VOLUME ，VOLUME 指向了一个/tmp的目录，由于Spring Boot使用内置的Tomcat容器，Tomcat 默认使用/tmp作为工作目录
VOLUME /tmp

#拷贝并且重命名(jar必须在dockerFile所在文件夹或者子文件夹 否则会报错Forbidden path outside the build context)
ADD target/webpos-0.0.1-SNAPSHOT.jar webpos-0.0.1-SNAPSHOT.jar

#容器启动命令 也可以用CMD 但CMD会被docker run的指令覆盖
ENTRYPOINT ["java","-jar","/webpos-0.0.1-SNAPSHOT.jar"]