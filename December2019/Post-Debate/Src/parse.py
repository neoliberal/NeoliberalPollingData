import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\December2019\Post-Debate\Raw\December 2019 Neoliberal Straw Poll.html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\December2019\Post-Debate\Recode\December2019.csv", 'wb'))

fout.writerow(["Joe Biden", "Pete Buttigieg", "Bernie Sanders", "Elizabeth Warren", "Andrew Yang", "Amy Klobuchar", "Tom Steyer"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(u'7')
    # drop troll ballots
    if temp != [u'7', u'7', u'7', u'7', u'7', u'7', u'7']:
        fout.writerow(temp)
    else:
        print("Blank")
