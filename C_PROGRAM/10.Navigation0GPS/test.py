import xml.etree.ElementTree as ET

tree = ET.parse('manh_0.sxp')
root = tree.getroot()

for elem in root.iter():
    print(elem.tag, elem.text)
