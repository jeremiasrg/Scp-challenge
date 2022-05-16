from datetime import datetime

def findStartLine(txt, position):
  while '\n' not in txt[position-3:position]  :
    position = position -1
  return position -2

def catchTime(listOccurrences, pathLog):
  # Open log file
  with open(pathLog) as f:
      txt = f.read()
  
  # create list to save data
  vTime = []
  # iterate occurrences 
  for occr in listOccurrences:
    place = 0
    # copy original text to other variable
    cptxt = txt
    while place != -1:
      # return the occurrence index 
      place = cptxt.find(occr)
      # if occurrence not found  
      if place == -1:
        break
      # return the index number of the current start line
      p = findStartLine(cptxt, place)
      # get time as String
      strtime = cptxt[p:p+12]
      # convert string to time
      t = datetime.strptime(strtime,"%H:%M:%S.%f")
      
      # add result to vTime list
      vTime.append({ 'moment':t, 'occr': occr,})
      # clean the text part that we won't use anymore
      cptxt = cptxt[place+ len(occr) :]
      # sort by moment field
      vTime.sort(key=lambda x: x['moment'])
      
  # remove repetitions
  noRepetitions = list({item['moment']:item for item in vTime}.values())

  # prepare output
  for i, occr in enumerate(noRepetitions):
    if(i!=0):
      # calc delta
      delta = noRepetitions[i]["moment"] - noRepetitions[i-1]["moment"]
      vStr = f"{delta} '{ noRepetitions[i-1]['occr'] }' to '{ occr['occr'] }'"
      print(vStr)

listOccurrences = [
  "Cloning repository",
  "Running unity command",
  "End running unity command",
  "Finished: SUCCESS"
  ]

catchTime(listOccurrences, './challenge-3/consoleText.txt')