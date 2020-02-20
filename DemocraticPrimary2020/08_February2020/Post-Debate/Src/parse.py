import bs4
import csv

i = 0
a = 0
b = 0

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\08_February2020\Post-Debate\Raw\19 February 2020 Neoliberal Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\08_February2020\Post-Debate\Recode\February2020.csv", 'wb'))

fout.writerow(["Joe Biden", "Pete Buttigieg", "Bernie Sanders", "Elizabeth Warren", "Amy Klobuchar", "Mike Bloomberg"])

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
            if temp != [u'6', u'6', u'1', u'2', u'6', u'6']:
                if temp != [u'3', u'5', u'1', u'2', u'4', u'6']:
                    fout.writerow(temp)
                else:
                    i+=1
            else:
                a+=1
        else:
            b+=1
    else:
        print("Blank")

print("Obvious Ballot Stuffing: " + str(i))
print("Left is best: " + str(a))
print("Bernie or Bust: " + str(b))
