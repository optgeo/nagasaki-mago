JAR := mago-3d-tiler-1.5.1-release1-natives-macos.jar

install:
	curl -OL https://github.com/Gaia3D/mago-3d-tiler/releases/download/v1.5.1-release1/$(JAR)

convert:
	java -Xmx12000m -jar $(JAR) --maxPoints 32768 --input src --inputType las --output dst --crs 6669 --debug

upload:
	aws s3 cp dst/ s3://us-west-2.opendata.source.coop/smartmaps/nagasaki-mago/

