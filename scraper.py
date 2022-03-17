import sys
from bs4 import BeautifulSoup
import requests
import json
import os

def main(breed):
    # create url
    url = "https://en.wikipedia.org/wiki/" + breed
    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')
    score = soup.find_all("p")
    for x in range(len(soup.find_all("p"))):
        if "empty-elt" not in str(score[x]):         # data is first non empty element
            data = soup.find_all("p")[x].get_text()
            break
    dic = {}
    split = data.split(". ")
    counter = 0
    for sentence in split:
        sentence = str(sentence)
        count = 70
        while count < len(sentence) -1:
            try:
                while sentence[count] != " " and count < len(sentence):
                    count += 1
                sentence = sentence[:count] + "\n" + sentence[count:]  # "     .insert(count, "\n")
            except:
                pass
            count += 70
        counter += 1
        dic["sentence"+str(counter)] = sentence
    count = 1
    with open("breedfacts.json", "w") as outfile:
        json.dump(dic, outfile)


if __name__ == "__main__":
    main(sys.argv[1])