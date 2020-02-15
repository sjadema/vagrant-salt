npm_update:
  cmd.run:
    - names:
      - npm config set prefix "$(dirname $(systemd-path user-binaries))"
      - npm i -g npm
    - runas:
        {{ pillar['home']['user'] }}
