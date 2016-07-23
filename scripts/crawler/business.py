#!/usr/bin/env python3
# -*- coding utf-8 -*-
# business.py 

class Business(object):

  def __init__(self, name, category, district, phone, address, zipcode):
    self.name = name
    self.category = category
    self.district = district
    self.phone = phone
    self.address = address
    self.zipcode = zipcode

  def get_name(self):
    names = [name.capitalize() for name in str(self.name).split(" ")]
    return(" ".join(names))

  def set_email(self, email):
    self.email = email
