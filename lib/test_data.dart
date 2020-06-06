class TestData{
  static final String country = "INSERT INTO country VALUES"
      "('792','Turkey'),"
      "('840','US'),"
      "('804','Ukraine'),"
      "('642','Romania'),"
      "('620','Portugal'),"
      "('300','Greece'),"
      "('250','France'),"
      "('124','Canada'),"
      "('246','Finland'),"
      "('276','Germany'),"
      "('752','Sweden'),"
      "('756','Switzerland');";

  static final String city = "INSERT INTO city VALUES"
      "('1','İstanbul','792'),"
      "('2','Kayseri','792'),"
      "('3','Ankara','792'),"
      "('4','Bucharest','642'),"
      "('5','Porto','620'),"
      "('6','Atina','300'),"
      "('7','Toulouse','250'),"
      "('8','Toronto','124'),"
      "('9','Helsinki','246'),"
      "('10','Berlin','276'),"
      "('11','Gothenburg','752'),"
      "('12','Zürich','756'),"
      "('13','Kiev','804'),"
      "('14','Virginia','840'),"
      "('15','California','840');";

  static final String company = "INSERT INTO company VALUES"
      "(1,'Bosch'),"
      "(2,'Dell'),"
      "(3,'Google'),"
      "(4,'Samsung'),"
      "(5,'Bellona'),"
      "(6,'Yataş'),"
      "(7,'Puma'),"
      "(8,'Adidas'),"
      "(9,'Apple'),"
      "(10,'Ülker'),"
      "(11,'Unilever'),"
      "(12,'Arçelik'),"
      "(13,'Reebok'),"
      "(14,'Eti'),"
      "(15,'Swiss Swatch'),"
      "(16,'MasterCorps'),"
      "(17,'Massive Dynamics');";

  static final String contact = "INSERT INTO contact_types VALUES"
      "(1,'E-mail'),"
      "(2,'Website'),"
      "(3,'Address'),"
      "(4,'Phone');";

  static final String departments = "INSERT INTO departments VALUES"
      "(1,'R&D'),"
      "(2,'Planning'),"
      "(3,'Production'),"
      "(4,'Logistic'),"
      "(5,'IT'),"
      "(6,'HR'),"
      "(7,'Design');";

  static final String studentInterests = "INSERT INTO student_interests VALUES"
      "(1,110210119),"
      "(2,111051548),"
      "(3,110654250),"
      "(4,110110154),"
      "(5,110110245),"
      "(6,110310654),"
      "(7,110910145),"
      "(8,110954123),"
      "(9,110785454),"
      "(10,110210259),"
      "(11,110210598),"
      "(12,110210478),"
      "(13,110110352),"
      "(14,110410215),"
      "(15,110410587),"
      "(16,110542145),"
      "(17,110510109);";

  static final String interests = "INSERT INTO interest_areas VALUES"
      "(1,'Machine Learning'),"
      "(2,'Virtual Reality'),"
      "(3,'Artificial Intelligence'),"
      "(4,'Augmented Reality'),"
      "(5,'Space'),"
      "(6,'Agriculture'),"
      "(7,'Medicine'),"
      "(8,'Farming'),"
      "(9,'Gaming'),"
      "(10,'Security'),"
      "(11,'Management'),"
      "(12,'Psychology'),"
      "(13,'Electricity'),"
      "(14,'Simulation');";

  static final String student = "INSERT INTO student VALUES"
      "(110210119,'SÖNMEZ','ALEV','M','IE',5078541524,'sönmez.alev@test.com','N'),"
      "(111051548,'BİLGİ','SAYAR','F','COMP',5078511425,'bilgi.sayar@test.com','N'),"
      "(110654250,'ENES','MAZLUM','M','EEE',5094512365,'enes.mazlum@test.com','Y'),"
      "(110110154,'RABİA','FAN','F','EEE',5411254136,'rabia.fan@test.com','Y'),"
      "(110110245,'AFET','GÜÇLÜ','F','MBG',4514584125,'afet.güçlü@test.com','Y'),"
      "(110310654,'RAŞİT','AYMAZ','M','MBG',NULL,'raşit.aymaz@test.com','Y'),"
      "(110910145,'FAHRİ','İDDİA','M','BA',NULL,'fahri.iddia@test.com','Y'),"
      "(110954123,'FERHAT','GEN','M','BA',NULL,'ferhat.gen@test.com','N'),"
      "(110785454,'AHMET','FALAKA','M','IE',NULL,'ahmet.falaka@test.com','Y'),"
      "(110210259,'PEMBE','FÜNLÜ','F','COMP',5079536564,'pembe.fünlü@test.com','Y'),"
      "(110210598,'MURTAZA','ADIKONMAZ','M','ME',5023659854,'murtaza.adıkonmaz@test.com','Y'),"
      "(110210478,'ÜLKÜ','PORSUK','F','ME',5034667481,'ülkü.porsuk@test.com','Y'),"
      "(110110352,'SANYA','PANAŞ','F','IE',5307468412,'sanya.panaş@test.com','N'),"
      "(110410215,'BAHTSIZ','BEDEVİ','M','ME',5154115454,'bahtsız.bedevi@test.com','N'),"
      "(110410587,'SATILMIŞ','EV','M','CE',1102104578,'satılmış.ev@test.com','N'),"
      "(110542145,'KÜRŞAT','BAĞDÖKEN','M','CE',5078951421,'kürşat.bağdöken@test.com','N'),"
      "(110510109,'TAYLAN','VALHA','M','CE',NULL,'taylan.valha@test.com','N');";

  static final String internship = "INSERT INTO internship VALUES"
      "(1,'2015-03-20 00:00:00','2015-06-20 00:00:00','xxx@gmail.com','Y',1,2.6,'Y','Y','Y',5,792,'R&D','e-mail',1,110210119),"
      "(2,'2019-05-20 00:00:00','2019-08-20 00:00:00','xxx@gmail.com','N',2,3.4,'N','Y','Y',4,840,'Planning','e-mail',2,111051548),"
      "(3,'2018-12-15 00:00:00','2019-02-15 00:00:00','xxx@gmail.com','y',4,2.6,'Y','Y','Y',1,804,'Production','e-mail',4,110654250),"
      "(4,'2015-03-20 00:00:00','2015-06-20 00:00:00','5078494515','Y',1,2.1,'N','Y','Y',7,642,'Logistic','Phone',3,110110154),"
      "(5,'2019-05-20 00:00:00','2019-08-20 00:00:00','5054851524','Y',2,3.1,'y','Y','Y',8,620,'IT','Phone',8,110110245),"
      "(6,'2018-12-15 00:00:00','2019-02-15 00:00:00','xxx.com','Y',1,3.2,'Y','Y','N',6,300,'HR','Website',7,110310654),"
      "(7,'2015-03-20 00:00:00','2015-06-20 00:00:00','xxx@gmail.com','Y',3,3.6,'Y','Y','Y',4,250,'Design','e-mail',9,110910145),"
      "(8,'2019-05-20 00:00:00','2019-08-20 00:00:00','xxx@gmail.com','N',4,3.5,'Y','Y','Y',14,124,'R&D','e-mail',10,110954123),"
      "(9,'2018-12-15 00:00:00','2019-02-15 00:00:00','xxx@gmail.com','N',3,2.1,'Y','N','Y',12,246,'Planning','e-mail',11,110785454),"
      "(10,'2015-03-20 00:00:00','2015-06-20 00:00:00','5031208533','Y',2,1.8,'N','N','Y',15,276,'Production','Phone',15,110210259),"
      "(11,'2019-05-20 00:00:00','2019-08-20 00:00:00','5007565542','N',3,2.4,'N','N','Y',14,752,'Logistic','Phone',14,110210598),"
      "(12,'2018-12-15 00:00:00','2019-02-15 00:00:00','xxx.com','Y',2,2.5,'Y','Y','Y',9,756,'IT','Website',12,110210478),"
      "(13,'2015-03-20 00:00:00','2015-06-20 00:00:00','xxx@gmail.com','Y',3,1.2,'N','Y','N',1,756,'HR','e-mail',6,110110352),"
      "(14,'2019-05-20 00:00:00','2019-08-20 00:00:00','xxx@gmail.com','N',4,1.6,'Y','Y','Y',2,840,'Design','e-mail',5,110410215),"
      "(15,'2018-12-15 00:00:00','2019-02-15 00:00:00','xxx@gmail.com','N',2,1.9,'Y','Y','Y',3,804,'R&D','e-mail',5,110410587),"
      "(16,'2015-03-20 00:00:00','2015-06-20 00:00:00','4983922551','N',3,2,'N','Y','Y',5,792,'Planning','Phone',4,110542145),"
      "(17,'2019-05-20 00:00:00','2019-08-20 00:00:00','4960279560','Y',1,2.6,'N','N','Y',8,792,'Production','Phone',2,110354895);";

}