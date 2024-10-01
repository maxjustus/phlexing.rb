# phlexing.rb

This is a dumb CLI that wraps the Phlexing gem used by https://www.phlexing.fun

To "install" just put the contents of `phlexing.rb` into a file in your path and make it executable.

`curl -o ~/.local/bin/phlexing.rb https://raw.githubusercontent.com/maxjustus/phlexing.rb/refs/heads/main/phlexing.rb && chmod +x ~/.local/bin/phlexing.rb`

then run `phlexing.rb` from your terminal.

## Usage

`phlexing.rb <input_file>.[erb|html]` or `echo 'erb_string' | phlexing.rb`

To write to a file just pipe the output: `phlexing.rb <input_file>.[erb|html] > output_file.rb`

If you're on MacOS, you can also pipe the contents of the clipboard into this command to convert
it to phlex: `pbpaste | phlexing.rb` (handy for converting from tailwind example code or whatever)

