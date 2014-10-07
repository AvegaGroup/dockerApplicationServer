*Directory to be used with a local git repository*

1) Put a copy of doodleshop here

2) Change go to use a local git repo:
--- a/go/etc/cruise-config.xml
+++ b/go/etc/cruise-config.xml
@@ -4,7 +4,7 @@
   <pipelines group="Doodleshop">
     <pipeline name="Build" labeltemplate="1.0.${COUNT}" isLocked="false">
       <materials>
-        <git url="https://github.com/dmarell/doodleshop" />
+        <git url="git://git/doodleshop" />
       </materials>
       <stage name="Set_version">
         <jobs>

