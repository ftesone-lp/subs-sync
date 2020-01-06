# subs-sync
Script to add/substract milliseconds to subtitles in .srt format

## Usage
perl subs-sync.pl *path/to/file.srt* *milliseconds_as_integer*

### Example
To add 5.5 seconds to subs.srt:

```sh
perl subs-sync.pl subs.srt 5500
```

To remove 1 minute and 2 seconds to subs2.srt:

```sh
perl subs-sync.pl subs2.srt -6200
```
