from bs4 import BeautifulSoup
import requests
import sys

def main(url):

    page = requests.get(url)
    
    # generate soup object
    soup = BeautifulSoup(page.content, 'html.parser')

    # get text from first p tag
    text = soup.find_all('p')

    # open a text file for writing the text found
    with open("output.txt", "w", encoding = "utf-8") as file:
        for i in range(4): 
            file.write(soup.find_all('p')[i].get_text())


if __name__ == "__main__":
    main(sys.argv[1])
