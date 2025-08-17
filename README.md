# Birth Stone Finder

A beautiful Ruby on Rails application that helps users discover their birth stone and learn about its magical properties. Users can enter their birth month and day to find their special gemstone and view detailed information about it.

## Features

- 🎂 **Birth Date Input**: Simple form to enter birth month and day
- 💎 **Gemstone Discovery**: Find your birth stone based on traditional associations
- 📱 **Responsive Design**: Works beautifully on desktop, tablet, and mobile
- 🎨 **Beautiful UI**: Gemstone-themed color palette with smooth animations
- 🖼️ **High-Quality Images**: Real gemstone images for each birth stone
- ♿ **Accessible**: WCAG compliant with proper focus states and alt text
- 🧪 **Tested**: Comprehensive test suite with 61 passing tests

## Birth Stones Included

- **January**: Garnet
- **February**: Amethyst
- **March**: Aquamarine
- **April**: Diamond
- **May**: Amber
- **June**: Moonstone
- **July**: Ruby
- **August**: Tiger's Eye
- **September**: Aventurine
- **October**: Opal
- **November**: Obsidian
- **December**: Turquoise

## Technology Stack

- **Backend**: Ruby on Rails 7.2.2
- **Database**: SQLite (development), PostgreSQL (production)
- **Frontend**: HTML, CSS, JavaScript (minimal)
- **Testing**: RSpec
- **Deployment**: Docker + Render

## Local Development

### Prerequisites

- Ruby 3.1.2
- Rails 7.2.2
- SQLite3
- Node.js and npm (for asset compilation)

### Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd birth_stone_app
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the development server:
   ```bash
   rails server
   ```

5. Visit `http://localhost:3000` in your browser

### Running Tests

```bash
bundle exec rspec
```

## Deployment on Render

This application is configured for deployment on Render with Docker.

### Prerequisites

- A Render account
- Your Rails master key (found in `config/master.key`)

### Deployment Steps

1. **Push your code to GitHub**

2. **Connect to Render**:
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New +" and select "Web Service"
   - Connect your GitHub repository

3. **Configure the Web Service**:
   - **Name**: `birth-stone-app` (or your preferred name)
   - **Environment**: `Ruby`
   - **Build Command**: `./bin/render-build.sh`
   - **Start Command**: `bundle exec rails server`

4. **Add Environment Variables**:
   - `RAILS_ENV`: `production`
   - `RAILS_MASTER_KEY`: Your Rails master key from `config/master.key`

5. **Create a PostgreSQL Database**:
   - Go to "New +" → "PostgreSQL"
   - Name it `birth-stone-app-db`
   - Select the same region as your web service

6. **Link the Database**:
   - In your web service settings, add the database as an environment variable
   - Render will automatically provide `DATABASE_URL`

7. **Deploy**:
   - Click "Create Web Service"
   - Render will build and deploy your application

### Alternative: Using render.yaml

If you prefer, you can use the included `render.yaml` file for automatic configuration:

1. Push your code with the `render.yaml` file
2. In Render, select "New +" → "Blueprint"
3. Connect your repository
4. Render will automatically create the web service and database

## Docker Deployment

### Building the Docker Image

```bash
docker build -t birth-stone-app .
```

### Running with Docker

```bash
docker run -p 3000:3000 \
  -e RAILS_ENV=production \
  -e DATABASE_URL=your_postgresql_url \
  -e RAILS_MASTER_KEY=your_master_key \
  birth-stone-app
```

## Environment Variables

### Required for Production

- `RAILS_ENV`: Set to `production`
- `RAILS_MASTER_KEY`: Your Rails master key
- `DATABASE_URL`: PostgreSQL connection string

### Database Configuration

The application automatically configures database connections based on environment variables provided by Render:

- `DATABASE_URL`: Full connection string
- `DATABASE_NAME`: Database name
- `DATABASE_USERNAME`: Database username
- `DATABASE_PASSWORD`: Database password
- `DATABASE_HOST`: Database host
- `DATABASE_PORT`: Database port
- `DATABASE_SSLMODE`: SSL mode (defaults to `require`)

## File Structure

```
birth_stone_app/
├── app/
│   ├── assets/
│   │   ├── images/          # Gemstone images
│   │   └── stylesheets/     # Custom CSS
│   ├── controllers/         # Rails controllers
│   ├── models/             # ActiveRecord models
│   └── views/              # ERB templates
├── config/
│   ├── database.yml        # Database configuration
│   └── routes.rb           # URL routing
├── db/
│   ├── migrate/            # Database migrations
│   └── seeds.rb            # Seed data
├── spec/                   # RSpec tests
├── Dockerfile              # Docker configuration
├── render.yaml             # Render deployment config
└── bin/
    └── render-build.sh     # Render build script
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run the test suite
6. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you encounter any issues or have questions, please open an issue on GitHub.
