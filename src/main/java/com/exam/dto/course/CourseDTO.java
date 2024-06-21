package com.exam.dto.course;

import org.apache.ibatis.type.Alias;

@Alias("CourseDTO")
public class CourseDTO {

    int id;
    String title;
    String name;
    int period;
    int price;
    String introduction;
    String link;
    String image;
    int sale;
    int session;
    String category;

    public CourseDTO() {}

    public CourseDTO(int id, String title, String name, int period, int price, String introduction, String link, String image,
            int sale, int session, String category) {
        this.id = id; // 추가된 id 속성
        this.title = title;
        this.name = name;
        this.period = period;
        this.price = price;
        this.introduction = introduction;
        this.link = link;
        this.image = image;
        this.sale = sale;
        this.session = session;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "CourseDTO [id=" + id + ", title=" + title + ", name=" + name + ", period=" + period + ", price=" + price
                + ", introduction=" + introduction + ", link=" + link + ", image=" + image + ", sale=" + sale
                + ", session=" + session + ", category=" + category + "]";
    }
}
