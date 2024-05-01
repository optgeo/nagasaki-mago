JAR := mago-3d-tiler-1.5.1-release1-natives-macos.jar
MAX_MEM := 15000m
MAX_POINTS := 32768
SRC_DIR := src/nagasaki-north
DST_DIR := dst/nagasaki-north

install:
	curl -OL https://github.com/Gaia3D/mago-3d-tiler/releases/download/v1.5.1-release1/$(JAR)

convert:
	java -Xmx$(MAX_MEM) -jar $(JAR) --maxPoints $(MAX_POINTS) --input $(SRC_DIR) \
	--inputType las --output $(DST_DIR) --crs 6669 --debug

upload:
	aws s3 cp dst/ s3://us-west-2.opendata.source.coop/smartmaps/nagasaki-mago/

