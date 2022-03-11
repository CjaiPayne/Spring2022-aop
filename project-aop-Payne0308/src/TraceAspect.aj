
public aspect TraceAspect {
   //point class
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);


   //tracing method
   pointcut methodToTrace():  classToTrace() &&  execution(String getName());


   //before trace
   before(): methodToTrace() {
            String info = thisJoinPointStaticPart.getSignature() + " , "
            + thisJoinPointStaticPart.getSourceLocation().getLine();
            System.out.println("\t [BEFORE] " + info);

      }
   //Tracing after
   after(): methodToTrace() {
      System.out.println("\t [AFTER]  " + thisJoinPointStaticPart.getSignatureLocation().getFileName());
   }
}
