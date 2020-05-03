import bs4
import csv

i = 0
a = 0
b = 0

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\01_April2020\Raw\April 2020 Running Mate Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\01_April2020\Recode\April.csv", 'wb'))

fout.writerow(["Elizabeth Warren", "Kamala Harris", "Stacey Abrams", "Gretchen Whitmer", "Amy Klobuchar", "Tammy Duckworth", "Catherine Cortez Masto", "Tammy Baldwin", "Michelle Lujan Grisham", "Val Demings"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(u'10')
    # drop troll ballots
    if temp != [u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10', u'10']:
        fout.writerow(temp)
    else:
        print("Blank")
