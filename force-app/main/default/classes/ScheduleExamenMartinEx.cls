public class ScheduleExamenMartinEx {
    public static void schedule() {
        ScheduleInicializeData objScheduleExamenMartin = new ScheduleInicializeData();
        String cronExpression = '0 0 5 * * ? *';
        String jobId = System.schedule('SchudeleForInicializeTest', cronExpression, objScheduleExamenMartin);
    }
}