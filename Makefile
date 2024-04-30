JAR := mago-3d-tiler-1.5.1-release1-natives-linux.jar

install:
	curl -OL https://github.com/Gaia3D/mago-3d-tiler/releases/download/v1.5.1-release1/$(JAR)

convert:
	java -jar $(JAR) --input src --inputType las --output dst --crs 6669 --debug


