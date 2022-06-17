import path from 'path';

export default function logsDir() {
  let dirname: string;

  if (process.env.NODE_ENV === 'production') {
    dirname = path.join(process.cwd(), 'logs/prod');
  } else {
    dirname = path.join(process.cwd(), 'logs/dev');
  }

  return dirname;
}
