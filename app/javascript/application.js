// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { TetrislyProvider } from '@virtuslab/tetrisly-react';
function App() {
    return (
      <TetrislyProvider
        theme={{
          colors: {
            '$color-semantic-brand--4': th.color('$color-raspberry--4'),
            '$color-semantic-brand--3': th.color('$color-raspberry--3'),
            '$color-semantic-brand--2': th.color('$color-raspberry--2'),
            '$color-semantic-brand--1': th.color('$color-raspberry--1'),
            '$color-semantic-brand-0': th.color('$color-raspberry-0'),
            '$color-semantic-brand-+1': th.color('$color-raspberry-+1'),
            '$color-semantic-brand-+2': th.color('$color-raspberry-+2'),
            '$color-semantic-brand-+3': th.color('$color-raspberry-+3'),
            '$color-semantic-brand-+4': th.color('$color-raspberry-+4'),
            '$color-semantic-brand-+5': th.color('$color-raspberry-+5'),
            '$color-semantic-brand-+6': th.color('$color-raspberry-+6'),
            '$color-semantic-brand-+7': th.color('$color-raspberry-+7'),
            '$color-semantic-brand-+8': th.color('$color-raspberry-+8'),
          },
        }}
      >
        <Mayo />
      </TetrislyProvider>
    );
  }