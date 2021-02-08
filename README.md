# Library Archive Action

This action will perform the [data library](https://github.com/NYCPlanning/db-data-library) `archive` command with given configurations, which would extract data from source and archive in in S3.

## Usage
1. Make sure you are setting the following credentials for where data library would need to archive data to
```yml
jobs:
  build:
    runs-on: ubuntu-20.04
    env: 
      AWS_S3_ENDPOINT: ${{ secrets.AWS_S3_ENDPOINT }}
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_S3_BUCKET:  ${{ secrets.AWS_S3_BUCKET }}
```

2. If you would like to import a pre-configured dataset included in the `library` package, you can declare the following:
> Check [here](https://github.com/NYCPlanning/db-data-library/tree/main/library/templates) for available datasets
```yml
- uses: NYCPlanning/action-library-archive@v1
  id: dcp_commercialoverlay
  with:
    # name of the dataset
    name: dcp_commercialoverlay

    # Upload to s3, default to false
    s3: false

    # Tag this version as latest, default to false
    latest: true
    
    # Zipped output files? default to false
    compress: true

    # Output format, seperated by spaces, available options
    # [geojson, pgdump, csv, shapefile]
    output_format: shapefile csv pgdump
``` 

3. If you would like to take a local configuration file specified by path
> Checkout [`dcp_mappluto.yml`](https://github.com/NYCPlanning/action-library-archive/raw/main/dcp_mappluto.yml)
```yml
# Git pull the repo
- uses: actions/checkout@v2

- uses: NYCPlanning/action-library-archive@v1
  id: pluto
  with:
    # Specify the path to the configuration file
    path: dcp_mappluto.yml 

    # You can also specify a version here
    version: 20v8
```

> Checkout [our sample workflow](https://github.com/NYCPlanning/action-library-archive/raw/main/.github/workflows/example.yml)
