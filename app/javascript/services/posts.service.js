export default {
  fetch(self) {
    const endpoint = 'http://localhost:3000/api/v1/posts'
    self.$http.get(endpoint).then(response => {
      self.posts = response.body
    }, response => {
      console.log('ошибка')
    })  
  }
}
