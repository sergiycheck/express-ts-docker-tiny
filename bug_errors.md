SOLVED
{
problem: {
not appending logs to access.log when starting
app with docker compose and command

    ```bash
    command: sh -c 'npm run start:prod'
    ```

}

solution {
specify volume in DockerFile
remove old volumes, rebuild with

```bash
docker-compose up --build
```

}

}
