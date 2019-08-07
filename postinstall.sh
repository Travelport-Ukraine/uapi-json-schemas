URL="https://support.travelport.com/webhelp/uapi/Content/Resources/uAPI_WSDLschema_Release-V18.4.1.19.zip"
VERSION="v47"

line() {
  echo "--------------------------------------------------"
}

echo "Downloading required resources"
line

npx download-cli \
  -s 1 \
  -e \
  --out dist/wsdl $URL

echo "Generating json(x) schemas"
line

java -jar node_modules/jsonix-schema-compiler/lib/jsonix-schema-compiler-full.jar \
     -generateJsonSchema dist/wsdl/air_${VERSION}_0/AirReqRsp.xsd dist/wsdl/universal_${VERSION}_0/UniversalRecordReqRsp.xsd

mv *_0.js ./jsonix-schema

for i in *.jsonschema; do
  mv "$i" "./json-schema/${i/jsonschema/json}";
done

echo "Generating typescript definitions"
line

DEBUG=dtsgen npx dtsgen -o ./types/uapi.d.ts ./json-schema/*.json