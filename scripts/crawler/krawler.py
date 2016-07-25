#!/usr/bin/env python3
# -*- coding utf-8 -*-
# krawler.py 

from urllib.error import HTTPError
from urllib.request import urlopen
from bs4 import BeautifulSoup
from crawler.business import Business

class Krawler:

  def __init__(self):
    self._companies = []
    self._categories = []
    self._site = "http://www.guiamais.com.br"

  def read(self, url):
    try:
      self._page = urlopen(self._site+url)
    except HTTPError as e:
      print(e)
    else:
      return BeautifulSoup(self._page.read(), "html5lib")

  def search(self, url):
    _soup = self.read(url)
    _the_list = _soup.findAll("div", { "class": "free" })
    _links = []

    for item in _the_list:
      h2 = item.find("h2")
      try:
        _links.append(h2.a["href"])
        self.catalog(item)
      except AttributeError:
        print("skiping")

  def goto(self, url):
    _page = self.read(url)
    _content = _page.find("div", { "class": "infoContent" })
    return _content

  def catalog(self, content):
    _link = content.find("h2").a["href"]
    _name = content.find("h2", { "class": "advTitle" }).get_text().strip()
    _category = content.find("p", { "class": "advCategory"}).get_text().strip()

    addr_tag = content.find("address").findAll("span")
    addr_text = addr_tag[0].prettify()

    try:
      addr_arr = [t.strip() for t in str(addr_text).split('<br/>')]
      _address = addr_arr[0].replace('<span>','').strip()
      _neightbor = addr_arr[1].replace('</span>','').strip()

      details = self.goto(_link)
      _phone = details.find("p", { "class": "phone" }).get_text().strip()
      _zipcode = details.find("address").findAll("span")[3].get_text().strip()

      _business = Business(_name,_category,_neightbor,_phone,_address,_zipcode)
      self._companies.append(_business)
      print(_business.get_name())
    except IndexError as e:
      print(e)

  def all(self):
    return self._companies

  def categories(self):
    return self._categories

  def fetch_categories(self):
    _page = self.read("/categorias/natal-rn")
    _ul = _page.findAll("ul", { "class": "grid" })
    for ul in _ul:
      for a in ul.findAll("a"):
        try:
          record = { "link": a["href"], "name": a.get_text().strip(), "subcategories": [] }
          self._categories.append(record)
        except TypeError as e:
          print(a.get_text().strip(), e)

  def fetch_subcategories(self):
    for record in self._categories:
      _cat_page = self.read(record["link"])
      _list = _cat_page.findAll("ul", { "class": "grid" })
      subcategories = []
      for ul in _list:
        for s in ul.findAll("a"):
          try:
            subcategories.append(s.get_text().strip())
          except:
            print(a.get_text().strip())
      record["subcategories"] = subcategories
      print(record["name"], len(subcategories))


