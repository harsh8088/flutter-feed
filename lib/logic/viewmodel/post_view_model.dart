import 'package:flutter_feed/model/post.dart';

class PostViewModel {
  List<Post> postItems;

  PostViewModel({required this.postItems});

  getPosts() => <Post>[
        Post(
            personName: "Amit Singh",
            address: "New Delhi, India",
            likesCount: 100,
            commentsCount: 10,
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100_960_720.jpg",
            messageImage: "",
            postTime: "Just Now"),
        Post(
            personName: "Ande Kill",
            address: "Cape Town",
            likesCount: 123,
            commentsCount: 78,
            messageImage:
                "https://images.unsplash.com/photo-1545022388-43a762e088b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2016/04/10/21/34/woman-1320810_960_720.jpg",
            postTime: "5h ago"),
        Post(
            personName: "Eric",
            address: "California",
            likesCount: 50,
            commentsCount: 5,
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2013/07/18/20/24/brad-pitt-164880_960_720.jpg",
            postTime: "2h ago"),
        Post(
            personName: "Jack",
            address: "California",
            likesCount: 23,
            commentsCount: 4,
            messageImage:
                "https://cdn.pixabay.com/photo/2014/09/07/16/53/hands-437968_960_720.jpg",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",
            postTime: "3h ago"),
        Post(
            personName: "Neha",
            address: "Punjab",
            likesCount: 35,
            commentsCount: 2,
            messageImage: "",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100_960_720.jpg",
            postTime: "1d ago"),
        Post(
            personName: "Jagdish Singh",
            address: "New Delhi, India",
            likesCount: 100,
            commentsCount: 10,
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",
            messageImage:
                "https://images.unsplash.com/photo-1545022388-43a762e088b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            postTime: "Just Now"),
        Post(
            personName: "Eric",
            address: "California",
            likesCount: 50,
            commentsCount: 5,
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2013/07/18/20/24/brad-pitt-164880_960_720.jpg",
            postTime: "2h ago"),
        Post(
            personName: "Jack",
            address: "California",
            likesCount: 23,
            commentsCount: 4,
            messageImage:
                "https://cdn.pixabay.com/photo/2014/09/07/16/53/hands-437968_960_720.jpg",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",
            postTime: "3h ago"),
        Post(
            personName: "Amanda",
            address: "Canada",
            likesCount: 123,
            commentsCount: 78,
            messageImage:
                "https://images.unsplash.com/photo-1545058803-e4ff5db914d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2016/04/10/21/34/woman-1320810_960_720.jpg",
            postTime: "5h ago"),
        Post(
            personName: "Neha",
            address: "Punjab",
            likesCount: 35,
            commentsCount: 2,
            messageImage:
                "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100_960_720.jpg",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100_960_720.jpg",
            postTime: "1d ago"),
        Post(
            personName: "Jacks ",
            address: "Polland",
            likesCount: 35,
            commentsCount: 2,
            messageImage:
                "https://images.unsplash.com/photo-1545066838-89c2e2e685f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100_960_720.jpg",
            postTime: "1d ago"),
        Post(
            personName: "Hamid",
            address: "Pune",
            likesCount: 35,
            commentsCount: 2,
            messageImage:
                "https://images.unsplash.com/photo-1545068124-fe1341c565c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://images.unsplash.com/photo-1545068124-fe1341c565c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            postTime: "2d ago"),
        Post(
            personName: "Esha",
            address: "Delhi",
            likesCount: 35,
            commentsCount: 2,
            messageImage:
                "https://images.unsplash.com/photo-1545022388-43a762e088b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://images.unsplash.com/photo-1545022388-43a762e088b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            postTime: "1d ago"),
        Post(
            personName: "Varun",
            address: "Himanchal",
            likesCount: 35,
            commentsCount: 2,
            messageImage:
                "https://images.unsplash.com/photo-1545035016-0cf9d4ea9e3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://images.unsplash.com/photo-1545035016-0cf9d4ea9e3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80",
            postTime: "1d ago"),
        Post(
            personName: "PubG",
            address: "Punjab",
            likesCount: 25,
            commentsCount: 1,
            messageImage:
                "https://images.unsplash.com/photo-1545033426-8b1722d9829a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://images.unsplash.com/photo-1545033426-8b1722d9829a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            postTime: "1d ago"),
        Post(
            personName: "Parul",
            address: "Assam",
            likesCount: 35,
            commentsCount: 2,
            messageImage:
                "https://images.unsplash.com/photo-1544896478-336dfd43cf99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://images.unsplash.com/photo-1544896478-336dfd43cf99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            postTime: "1d ago"),
        Post(
            personName: "Neha",
            address: "Punjab",
            likesCount: 12,
            commentsCount: 4,
            messageImage:
                "https://images.unsplash.com/photo-1545022388-43a762e088b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            message:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            personImage:
                "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100_960_720.jpg",
            postTime: "1d ago"),
      ];
}
