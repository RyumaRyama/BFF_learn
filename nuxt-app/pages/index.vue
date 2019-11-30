<template>
  <section class="container">
    <input type="text" placeholder="寿司食べたい" v-model="content"/>
    <button @click="contentPost">投稿</button>
    <ul>
      <li v-for="post_data in posts">
        {{ post_data.content }}({{ post_data.created_at }})
      </li>
    </ul>
    {{ posts }}
  </section>
</template>

<script>
const axios = require('axios');

let posts_path = 'http://127.0.0.1:3001/posts';
async asyncData() {
  let result = await axios.get(posts_path);
  return { resultData: result.data.data };
}

export default {
  data() {
    return {
      content: '',
      posts: asyncData()
    }
  },
  methods: {
    contentPost() {
      axios.post(posts_path, {content: content})
      axios.get(posts_path).then((res) => {
        this.posts = res.data.data;
      })
    }
  }
}
</script>
