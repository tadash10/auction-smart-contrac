import iso8601
import datetime

# Define a function to parse a datetime string in ISO format
def parse_iso_date(date_string):
    try:
        return iso8601.parse_date(date_string)
    except iso8601.ParseError:
        return None

# Define a function to format a datetime object as an ISO string
def format_iso_date(date_obj):
    return date_obj.isoformat()

# Define a function to calculate the difference between two dates in seconds
def date_difference_seconds(start_date, end_date):
    if not isinstance(start_date, datetime.datetime) or not isinstance(end_date, datetime.datetime):
        return None
    time_delta = end_date - start_date
    return time_delta.total_seconds()

# Define a function to calculate the difference between two dates in minutes
def date_difference_minutes(start_date, end_date):
    seconds = date_difference_seconds(start_date, end_date)
    if seconds is None:
        return None
    return seconds / 60

# Define a function to calculate the difference between two dates in hours
def date_difference_hours(start_date, end_date):
    minutes = date_difference_minutes(start_date, end_date)
    if minutes is None:
        return None
    return minutes / 60

# Define a function to calculate the difference between two dates in days
def date_difference_days(start_date, end_date):
    hours = date_difference_hours(start_date, end_date)
    if hours is None:
        return None
    return hours / 24

# Prompt the user to enter a start and end date in ISO format
start_date_str = input("Enter a start date in ISO format (YYYY-MM-DDTHH:MM:SS): ")
end_date_str = input("Enter an end date in ISO format (YYYY-MM-DDTHH:MM:SS): ")

# Parse the input dates
start_date = parse_iso_date(start_date_str)
end_date = parse_iso_date(end_date_str)

# Calculate the difference between the dates
if start_date is not None and end_date is not None:
    print("Time difference in seconds: {:.2f}".format(date_difference_seconds(start_date, end_date)))
    print("Time difference in minutes: {:.2f}".format(date_difference_minutes(start_date, end_date)))
    print("Time difference in hours: {:.2f}".format(date_difference_hours(start_date, end_date)))
    print("Time difference in days: {:.2f}".format(date_difference_days(start_date, end_date)))
else:
    print("Invalid date format")
