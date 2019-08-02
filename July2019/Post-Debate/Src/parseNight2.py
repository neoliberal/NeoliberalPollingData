import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\NeoliberalPollingData\July2019\Post-Debate\Raw\July 2019 Neoliberal Project Post-Debate Straw Poll (31 July Debate).html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\NeoliberalPollingData\July2019\Post-Debate\Recode\night2.csv", 'wb'))

fout.writerow(["Cory Booker", "Andrew Yang", "Julian Castro", "Bill de Blasio", "Michael Bennet", "Jay Inslee", "Tulsi Gabbard", "Kirsten Gillibrand", "Kamala Harris", "Joe Biden"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(10)
    fout.writerow(temp)
