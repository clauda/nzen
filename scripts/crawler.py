#!/usr/bin/env python3
# -*- coding utf-8 -*-
# crawler.py
import time
import csv
from crawler.krawler import Krawler

start_at = time.time()
page = 100
kraw = Krawler()

def place():
  csvFile = open("db/data/services.csv", "wt")
  try:
    writer = csv.writer(csvFile)
    for record in kraw.all():
      writer.writerow((record.get_name(),record.category,record.district,record.phone,record.address,record.zipcode))
  finally:
    csvFile.close()

for i in range(100):
  page += 1
  url = "/natal-rn/tudo-na-regiao?page={0}".format(str(page))
  kraw.search(url)
  place()

print("--- %s seconds ---" % (time.time() - start_at))