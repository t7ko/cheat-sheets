Hotkeys:

* <https://docs.gitlab.com/ee/user/shortcuts.html>
* `e` -- edit current page
* `Ctrl+Enter` -- commit/save

Other stuff:

* Collapsible chunks of text: <https://docs.gitlab.com/ce/user/markdown.html#details-and-summary>

```
<p>
<details>
<summary>Click this to collapse/fold.</summary>

These details <em>remain</em> <strong>hidden</strong> until expanded.

<pre><code>PASTE LOGS HERE</code></pre>

</details>
</p>
```

Markdown syntax:

* <https://www.markdownguide.org/basic-syntax/>
* https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
* GitHub tables: https://www.pluralsight.com/guides/working-tables-github-markdown

PlantUML mind map:

* [UML](manuals/UML).
* <https://plantuml.com/mindmap-diagram>
* GitHub plantuml: <https://gist.github.com/noamtamim/f11982b28602bd7e604c233fbe9d910f>

Utils:

* URL Encoder (for page slugs): <https://www.urlencoder.org/>.
* Paste-to-markdown: <https://euangoddard.github.io/clipboard2markdown/>

reStructuredText:

* https://gist.github.com/ionelmc/e876b73e2001acd2140f
* https://docutils.sourceforge.io/docs/ref/rst/directives.html


GitLab locally
==============

Official:

* https://docs.docker.com/engine/install/centos/
* https://docs.gitlab.com/runner/install/docker.html

3rd party manual:

* https://www.linode.com/docs/guides/install-gitlab-with-docker/
* Basic steps:

```
yum install docker
systemctl enable docker
systemctl start docker
yum clean packages # to free space in /var
sudo docker pull gitlab/gitlab-ce:latest

# Run:
  docker run --detach --hostname YOUR_HOSTNAME \
    --publish 443:443 --publish 80:80 --publish 12322:22 \
    --name gitlab --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab   \
    --volume /srv/gitlab/data:/var/opt/gitlab  \
    --env GITLAB_OMNIBUS_CONFIG="external_url 'http://YOUR_HOSTNAME';" \
    gitlab/gitlab-ce:latest

```

* Or -- if using podman:
  ```
  podman generate systemd --new --name gitlab > /etc/systemd/system/gitlab.service`
  systemctl list-unit-files | grep gitlab
  systemctl enable gitlab
  ```

* Monitoring status/logs:
  * sudo docker logs -f gitlab


Gollum
======

* Upgrade ruby:
  * https://cloudwafer.com/blog/installing-ruby-on-centos-7/
  * use rbenv method
* Update cmake:
  * https://gist.github.com/1duo/38af1abd68a2c7fe5087532ab968574e

    ```
    wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz
    tar zxvf cmake-3.*
    cd cmake-3.*
    ./bootstrap --prefix=/usr/local
    make -j$(nproc)
    make install
    cmake --version
    ```

* Ruby gems:
  * gem install webrick
    * Hint from here: https://retifrav.github.io/blog/2021/01/07/gollum-markdown-wiki/
* Gollum howto:
  * https://github.com/gollum/gollum
