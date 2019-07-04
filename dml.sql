alter table post add column date_created date;
alter table post add column subcat_id int;
alter table subcat drop foreign key cat_subcat;
alter table subcat drop column cat_id;
alter table post drop column date_created;
alter table post drop foreign key post_subcat;
alter table post drop foreign key cat_post;
alter table post drop column subcat_id;
alter table post drop foreign key post_subcat;
drop table subcat;
alter table category  add column subcat_id int not null;
alter table category add constraint Self foreign key (subcat_id) references category (cat_id);
alter table post add column subcat_id int not null;
alter table post add constraint cat_post foreign key (subcat_id) references category (subcat_id);
ALTER TABLE post CHANGE COLUMN date_created created_date date;
alter table post add constraint subcat_id foreign key (subcat_id) references category (subcat_id);
select * from post;
insert into blog (blog_id,blog_name,blog_url) values ( 2,"Saravana","mystories.com/food");
insert into blog (blog_id,blog_name,blog_url) values ( 1,"Sang555","mybrainstoppedworking.com/life");
insert into blog (blog_id,blog_name,blog_url) values ( 3,"Shiva","mytwostories.com/work");
insert into blog (blog_id,blog_name,blog_url) values ( 4,"Shanu","myonestories.com/travel"); 

insert into category(cat_id,name,blog_id,subcat_id) values ( 100,"Food",1,100);
insert into category(cat_id,name,blog_id,subcat_id) values ( 101,"Continental",1,100);
insert into category(cat_id,name,blog_id,subcat_id) values ( 102,"travel",4,102);
insert into category(cat_id,name,blog_id,subcat_id) values ( 103,"work",3,103);

alter table comments add primary key (comment_id);


insert into post ( post_id,title,author_name,created_date,subcat_id) values ( 202,"Home","Saro","25/02/19",100);
insert into post ( post_id,title,author_name,created_date,subcat_id) values ( 201,"welcome","Sangg","20/02/18",100);
insert into post ( post_id,title,author_name,created_date,subcat_id) values ( 203,"travelvlog","payal","22/02/19",102);
insert into post ( post_id,title,author_name,created_date,subcat_id) values ( 204,"Workaholic","jona","28/02/18",103);
insert into post ( post_id,title,author_name,created_date,subcat_id) values ( 205,"Cooking","ronak","2000-09-18",100);
insert into post ( post_id,title,author_name,created_date,subcat_id) values ( 206,"Cooking124","rona","2000-05-18",102);

insert into comments (comment_id,post_id,comment_by,comment_text) values (400,202,"Keshu","overwhelmed!");
insert into comments (comment_id,post_id,comment_by,comment_text) values (401,201,"hema","Good work!");
insert into comments (comment_id,post_id,comment_by,comment_text) values (402,203,"Diti","truee!");
insert into comments (comment_id,post_id,comment_by,comment_text) values (403,204,"Bhavani","Loved it!");

insert into tag (tag_id,tag_name) values (511,"Tag1");
insert into tag (tag_id,tag_name) values (512,"Tag2");
insert into tag (tag_id,tag_name) values (513,"Tag3");
insert into tag (tag_id,tag_name) values (514,"Tag4");

insert into post_tag (tag_id,post_id) values (511,202);
insert into post_tag (tag_id,post_id) values (512,201);
insert into post_tag (tag_id,post_id) values (513,203);
insert into post_tag (tag_id,post_id) values (514,204);

select blog_name from blog where blog_id = "2";
select * from comments;
select cat_id,name from category where blog_id = "1";
select cat_id,name from category where blog_id = "1" and name = "Food";

update post set title = "Around the world!!" where post_id="203";
select * from post;
select * from category where name="Food";

delete from post_tag where tag_id="511";
 
update post set created_date = "1998-09-18" where post_id in (201,202,203,204);

select post.title,comments.comment_text 
from post inner join comments on post.post_id=comments.post_id;

select post.title,comments.comment_text 
from post left join comments on post.post_id=comments.post_id;

select post.title as Post_Title,comments.comment_text 
from post join comments on post.post_id=comments.post_id;

select post.post_id,post.title,post_tag.tag_id,comments.comment_text from post inner join comments on  post.post_id=comments.post_id inner join post_tag on post.post_id=post_tag.post_id;

select post.post_id,post.title as Post_Title,comments.comment_text 
from post join comments on post.post_id=comments.post_id order by post.post_id ASC;

select name,count(subcat_id) as c from category group by subcat_id  having c > 1;

select category.cat_id, category.name  from category inner join post on category.subcat_id=post.subcat_id ;


select * from post;
select * from category;
show create table post;
