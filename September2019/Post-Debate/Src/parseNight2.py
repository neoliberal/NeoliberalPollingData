import bs4
import csv

soup = bs4.BeautifulSoup(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\JulyDebate\Post-Debate\Raw\July 2019 Neoliberal Project Post-Debate Straw Poll (31 July Debate).html", 'r'), 'html.parser')
fout = csv.writer(open(r"C:\Users\39174\Documents\GitHub\NeoliberalPollingData\JulyDebate\Post-Debate\CSV\night2.csv", 'wb'))

fout.writerow(["Cory Booker", "Andrew Yang", "Julian Castro", "Bill de Blasio", "Michael Bennet", "Jay Inslee", "Tulsi Gabbard", "Kirsten Gillibrand", "Kamala Harris", "Joe Biden"])

for ballot in soup.find_all("div", "ballot"):
    temp = []
    for vote in ballot.find_all("div", "rank"):
        try:
            temp.append(vote.contents[0])
        except IndexError:
            temp.append(10)
    fout.writerow(temp)
