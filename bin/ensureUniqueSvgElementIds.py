#! /usr/bin/env python
"""
Given a list of folders, recursively searches for svg files.
Then, examines each file and ensures each element id is unique across all svg files.
"""

# from lxml import etree
import sys, os, os.path, re
srcfolders = sys.argv[1:] if len(sys.argv) >= 2 else [os.getcwd()] 

svgs = []

for srcfolder in srcfolders:
	for root, subFolders, files in os.walk(srcfolder):
		for file in files:
			if file.endswith(".svg"):
				f = os.path.join(root, file)
				svgs.append(f)
				# print f

#Unique ids
idre = re.compile('[ \t]id=["\']((path|stop|rect|perspective|outline|text|filter|feGaussianBlur|embedded|ellipse|roundcorner|circle|convolve|g|linearGradient|svg|site|guide|layer|radialGradient|flowRoot|use)[A-Za-z0-9_:\-]+)["\'][ \t]')
globalIds = {}
def getUniqueId(oldId):
	idCounter = 1
	possibleId = oldId + "_" + str(idCounter)
	while globalIds.has_key(possibleId):
		idCounter += 1
		possibleId = oldId + "_" + str(idCounter)
	return possibleId

for f in svgs:
	#If colliding ids are found, replace all instances
	fileIds = {}
	replacements = {}
	text = open(f,'r').read()
	for p in re.findall(idre, text):
		id = p[0]
		# print id
		if globalIds.has_key(id):
			print os.path.basename(f) + " id collision=" + id
			replacements[id] = getUniqueId(id)
			fileIds[replacements[id]] = True
		else:
			fileIds[id] = True
	#Add file ids to global ids
	for id in fileIds.keys():
		globalIds[id] = True
		
	for replacement in replacements.items():
		print replacement
		text = re.sub(replacement[0], replacement[1], text)
	file = open(f, 'w')
	file.write(text)
	file.close()
		
