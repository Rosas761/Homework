from selenium import webdriver
from bs4 import BeautifulSoup
import requests
import time 
import pprint
import pandas as pd
import numpy as np

def init_browser():
    return webdriver.Chrome("windows/chromedriver.exe")

def scrape_info():
    browser = init_browser()


    # %%
    browser = webdriver.Chrome('windows/chromedriver')
    url1 = 'https://mars.nasa.gov/news/?page=0&per_page=40&order=publish_date+desc%2Ccreated_at+desc&search=&category=19%2C165%2C184%2C204&blank_scope=Latest'
    url2 = 'https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars'
    url3 = "https://twitter.com/marswxreport?lang=en"
    url4 = "https://space-facts.com/mars/"
    url5 = "https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars"
    


    # %%
    # 1.
    browser.get(url1)
    html1 = browser.page_source
    soup1 = BeautifulSoup(html1, 'html.parser')
    headlines = soup1.find_all('div', class_="content_title")
    paragraphs = soup1.find_all('div', class_="article_teaser_body")


    # %%
    headline = headlines[0]
    news_title = headline.a.text
    News_Title = "News Title: " + news_title
            
    paragraph = paragraphs[0]
    news_p = paragraph.text
    Content = "Content: " + news_p
    

    # %%
    # 2.
    browser.get(url2)
    html2 = browser.page_source
    soup2 = BeautifulSoup(html2, 'html.parser')
    soup2
    mars_pics = soup2.find_all('article', class_="carousel_item")[0]["style"]


    # %%
    relative_path2 = mars_pics.split("('")[1].split("'")[0]
    full_path2 = 'https://www.jpl.nasa.gov' + relative_path2
    full_path2


    # %%
    featured_image_url = mars_pics
    print(featured_image_url)
   

    # %%
    # 3.
    browser.get(url3)
    html3 = browser.page_source
    soup3 = BeautifulSoup(html3, 'html.parser')
    mars_weather = soup3.find_all('div', class_="js-tweet-text-container")[0].text
    print(mars_weather)
    

    # %%
    # 4.
    fact_table = pd.read_html(url4)


    # %%
    Mars_Earth_Comparison1 = fact_table[0]
    Mars_Earth_Comparison2 = fact_table[1]

    html_table1 = Mars_Earth_Comparison1.to_html()
    html_table2 = Mars_Earth_Comparison2.to_html()

    table1 = html_table1.replace('\n', '')
    table2 = html_table2.replace('\n', '')


    # %%
    browser.get(url5)


    # %%
    html5 = browser.page_source
    soup5 = BeautifulSoup(html5, 'html.parser')
    pictures = soup5.find_all('div', class_="item")
    titles = soup5.find_all("div", class_='description') #Put attribute here. See above 


    # %%
    urls = []
    for picture in pictures:
        print(picture.img["src"]) 
        print("----------------------------------------")
        urls.append(picture.img["src"])
        
    #Get URL


    websites = []
    for url in urls:
        full_path3 = 'https://astrogeology.usgs.gov' + url
        print(full_path3)
        websites.append(full_path3)


    # %%
    titles_list = []
    for title in titles:
        print(title.h3.text)
        titles_list.append(title.h3.text)


    # %%
    hemisphere_image_urls = []

    for i in np.arange(0,4):
        tts ={"Title: ":titles_list[i], "img_url: ": urls[i]}
        hemisphere_image_urls.append(tts)

    print(hemisphere_image_urls)


    # %%
    for hemisphere_image_url in hemisphere_image_urls:
        print(hemisphere_image_url)
        print("--------------------------------------------------------------------------------------------------------------")

    Mars_Data1 = {"News_Title": News_Title, "Content": Content, "Mars_Pic": full_path2, "Mars_Weather": mars_weather,"Mars_Data_Table_1": table1, "Mars_Data_Table_2": table2, "Hemisphere_image_urls": websites}


    browser.close()

    return Mars_Data1


