import xml.etree.ElementTree as ET
from xml.dom import minidom
import json
import sys
import csv
import os
from ntpath import basename, dirname



def extractBomFromXml(file_path):
    bom = []
    xmldoc = minidom.parse(file_path)
    itemlist = xmldoc.getElementsByTagName('comp')
    for item in itemlist:
        ref = item.attributes['ref'].value  #KeyError
        value = item.getElementsByTagName("value")[0].firstChild.data
        try:
            footprint = item.getElementsByTagName("footprint")[0].firstChild.data # IndexError:
        except IndexError:
            footprint = ""

        try:
            fields = item.getElementsByTagName("fields")[0].getElementsByTagName("field")
        except IndexError:  # doesnt have custom fields
            fields = []
        part_number = None
        keys = None
        for field in fields:
            field_name = field.attributes['name'].value
            field_value = field.firstChild.data
            # print(t)
            if (field_name == "PartNumber"):
                part_number = field_value
            elif (field_name == "Keys"):
                keys = field_value

        component = {
            "ref": ref,
            "value": value,
            "footprint": footprint.split(':')[-1],  # remove library name
            "part_number": part_number,
            "keys": keys,
        }
        # print(component)
        bom.append(component)
    return bom

def generateJlcpcbBom(bom, output_path):
    # Assembly file 
    with open(output_path + "_BOM_Assembly.csv", 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        csvwriter.writerow(['Comment', 'Designator', 'Footprint', 'LCSC Part'])
        for line in bom:
            if not line['keys'] or line['keys'].strip() not in ['DNP', 'EXCLUDE']:
                csvwriter.writerow([line['value'], line['ref'], line['footprint'], line['part_number']])
    # Remaining file (do not place components)
    with open(output_path + "_BOM_Remaining.csv", 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        csvwriter.writerow(['Comment', 'Designator', 'Footprint', 'LCSC Part'])
        for line in bom:
            if line['keys'] and line['keys'].strip() == 'DNP':
                csvwriter.writerow([line['value'], line['ref'], line['footprint'], line['part_number']])
    # exclude components (just to check)
    with open(output_path + "_BOM_Excluded.txt", 'w') as file:
        for line in bom:
            if line['keys'] and line['keys'].strip() == 'EXCLUDE':
                file.write("{}\t{}\n".format(line['ref'], line['value']))


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("2 arguments required: netlist xml file, and output file")
        sys.exit(1)
    input_file = sys.argv[1]
    output_path = sys.argv[2]
    # input_file  = "/home/dani/github/SuperPower/PCB_Raspberry_Pi/SuperPower_Raspberry_Pi.xml"
    # output_path = "/home/dani/github/SuperPower/PCB_Raspberry_Pi/SuperPower_Raspberry_Pi"
    bom = extractBomFromXml(input_file)
    # print(json.dumps(bom, indent=4))
    generateJlcpcbBom(bom, output_path)
