import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\07_February2020\Post-Debate\Raw\February 2020 Neoliberal Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\07_February2020\Post-Debate\Recode\February2020.csv", 'wb'))

fout.writerow(["Joe Biden", "Pete Buttigieg", "Bernie Sanders", "Elizabeth Warren", "Amy Klobuchar", "Tom Steyer"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(u'6')
    # drop troll ballots
    if temp != [u'6', u'6', u'6', u'6', u'6', u'6']:
        if temp != [u'6', u'6', u'1', u'6', u'6', u'6']:
            fout.writerow(temp)
        else:
            print("Bernie or Bust")
    else:
        print("Blank")
