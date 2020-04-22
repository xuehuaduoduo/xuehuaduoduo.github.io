{% if page.comments %}
  <div class="comments" id="comments">




      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
      <script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
      <div id="gitalk-container"></div>
      <script>
        const gitalk = new Gitalk({
          clientID: 'b3832817a1ce652776f5',
          clientSecret: 'ae9b7ada193a858775a70d4f916fe599a0e6d600',
          repo: 'xuehuaduoduo.github.io',
          owner: 'xuehuaduoduo',
          admin: ['xuehuaduoduo'],
          id: decodeURI(location.pathname),      // Ensure uniqueness and length less than 50
          distractionFreeMode: false  // Facebook-like distraction free mode
        })

        gitalk.render('gitalk-container')
      </script>


  


  </div>
{% endif %}


