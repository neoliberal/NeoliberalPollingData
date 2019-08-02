import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\NeoliberalPollingData\July2019\Post-Debate\Raw\July 2019 Neoliberal Project Post-Debate Straw Poll (30 July Debate).html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\NeoliberalPollingData\July2019\Post-Debate\Recode\night1.csv", 'wb'))

fout.writerow(["Amy Klobuchar", "Beto O'Rourke", "Pete Buttigieg", "Steve Bullock", "John Delaney", "John Hickenlooper", "Tim Ryan", "Marianne Williamson", "Elizabeth Warren", "Bernie Sanders"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(10)
    fout.writerow(temp)
